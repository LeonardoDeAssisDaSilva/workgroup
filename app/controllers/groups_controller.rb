class GroupsController < ApplicationController

  def index
    if params[:"srch-term"]
      @groups = Group.search(params[:"srch-term"]).order("created_at DESC").paginate(page: params[:page], :per_page => 15)
    else
      @groups = Group.paginate(page: params[:page], :per_page => 15)
    end
  end

  def show
    @group = Group.find(params[:id])
    @members = Member.where("group_id = ?", params[:id]).paginate(page: params[:page])
  end

  def new
    @group = Group.new
  end

  def create
    default_values
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
      params.require(:group).permit(:picture, :name, :area, :description, :private)

    end

    def default_values
      params[:picture] ||= "/uploads/group/picture/default/group.png"
    end
end
