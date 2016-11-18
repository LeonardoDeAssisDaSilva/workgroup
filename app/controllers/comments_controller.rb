class CommentsController < ApplicationController
  def index
    @task = Task.find(params[:id])
    @comments = @task.comments.paginate(page: params[:page], :per_page => 15)

  end

  def create
    task = Task.find(params[:comment][:task_id])
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

  private

    def comment_params
      params[:comment][:ancestry] = nil if params[:comment][:ancestry] == ""
      params.require(:comment).permit(:task_id, :user_id, :ancestry, :content)
    end
end
