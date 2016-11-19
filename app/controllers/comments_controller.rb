class CommentsController < ApplicationController
  def index
    @task = Task.find(params[:id])
    @comments = @task.comments.all.arrange(:order => :created_at)
  end

  def create
    task = Task.find(params[:comment][:task_id])
    # @comment = params[:comment][:ancestry].empty? ? Comment.new(comment_params) :
    #                                             Comment.find(params[:comment][:ancestry]).children.create(comment_params)
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Comentário submetido"
      redirect_to task_comments_path(task.group.id, task.id)
    else
      flash[:danger] = "Erro ao submeter comentário"
      redirect_to group_task_path(task.group.id, task.id)
    end
  end

  def edit
    @comment = @task.comments.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comments.update_attributes(comment_params)
      flash[:success] = "Comentário atualizado"
      redirect_to @comment.task
    else
      render @comment.task
    end
  end

  def destroy
  end

  def vote_up
    comment = Comment.find(params[:id])
    if current_user.voted_up_on?(comment)
      comment.unliked_by current_user
    else
      comment.undisliked_by current_user if current_user.voted_down_on?(comment)
      comment.liked_by current_user
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js   { render :partial => "/comments/voting_buttons" }
      format.json { render json: { count: comment.get_upvotes.size - comment.get_downvotes.size }}
    end
  end

  def vote_down
    comment = Comment.find(params[:id])
    if current_user.voted_down_on?(comment)
      comment.undisliked_by current_user
    else
      comment.unliked_by current_user if current_user.voted_up_on?(comment)
      comment.disliked_by current_user
    end
    respond_to do |format|
      format.html { redirect_to :back }
            format.js   { render :partial => "/comments/voting_buttons" }
      format.json { render json: { count: comment.get_upvotes.size - comment.get_downvotes.size }}
    end
  end

  private

    def comment_params
      if params[:comment][:ancestry] == ""
        params[:comment][:ancestry] = nil
      else
          params[:comment][:ancestry] = Comment.find(params[:comment][:ancestry]).path_ids.join('/')
      end
      params.require(:comment).permit(:task_id, :user_id, :ancestry, :content)
    end
end
