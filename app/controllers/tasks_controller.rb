class TasksController < ApplicationController

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


  private

    def task_params
      params.require(:task).permit(:member_id, :title, :priority, :deadline, :description)
    end
end
