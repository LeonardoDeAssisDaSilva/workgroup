class GroupsController < ApplicationController
  def index
    @groups = Group.paginate(page: params[:page])
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.save
    redirect_to @group
  end

  private

    def group_params
      params.require(:group).permit(:name, :area, :description)
    end

end
