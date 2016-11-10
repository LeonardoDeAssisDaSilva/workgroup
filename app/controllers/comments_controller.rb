class CommentsController < ApplicationController
  def index
    @task = Task.find(params[:id])
    @comments = @task.comments.paginate(page: params[:page], :per_page => 15)
  end
  
  def create
    @comment = Comment.new(comment_params)
    debugger
    if @comment.save
      flash[:success] = "Comentário submetido"
      redirect_to task_comments_path(@comment.task.group.id, @comment.task.id)
    else
      task = Task.find(params[:comment][:task_id])
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
      
#       params[:comment].delete_if { |key, value| value == "" }
#       params[:comment][:ancestry] = nil
      #params[:comment]
    end
end
