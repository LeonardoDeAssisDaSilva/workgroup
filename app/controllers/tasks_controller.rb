class TasksController < ApplicationController
  helper_method :author

  def new
    group = Group.find(params[:group_id])
    @task = group.tasks.build
  end

  def create
    group = Group.find(params[:group_id])
    @task = group.tasks.new(task_params)
    if @task.save
      redirect_to group
    else
      render 'new'
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  private

    def task_params
      params.require(:task).permit(:title, :priority, :deadline,
                                   :description, :group_id, :user_id)
    end

    def author
      @task.user
    end
end
