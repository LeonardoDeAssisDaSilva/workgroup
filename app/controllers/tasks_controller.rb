class TasksController < ApplicationController
  helper_method :author

  def new
    group = Group.find(params[:group_id])
    @task = Task.new
  end

  def create
    group = Group.find(params[:group_id])
    @task = Task.new(task_params)
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
      params.require(:task).permit(:member_id, :title, :priority, :deadline, :description)
    end

    def author
      @task.member.user.name
    end
end
