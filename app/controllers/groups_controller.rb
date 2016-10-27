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
    if @group.save
      @group.members.create!(group: @group, user: current_user, admin: true )
      redirect_to @group
    else
      render 'new'
    end
  end

  private

    def group_params
      params.require(:group).permit(:name, :area, :description)
    end

end
