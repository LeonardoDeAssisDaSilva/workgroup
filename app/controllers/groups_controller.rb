class GroupsController < ApplicationController
  before_action :logged_in_user, only: [:show, :new, :create]

  def index
    @groups = Group.paginate(page: params[:page], :per_page => 15)
  end

  def show
    @group = Group.find(params[:id])
    @members = Member.where("group_id = ?", params[:id]).paginate(page: params[:page])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @group.members.create!(user: current_user, admin: true)
      redirect_to @group
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      flash[:success] = "Grupo atualizado"
      redirect_to @group
    else
      respond_to do |format|
        format.js
        format.html
      end
    end
  end

  private

    def group_params
      params.require(:group).permit(:name, :area, :description)
    end

end
