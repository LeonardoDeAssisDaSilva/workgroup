class GroupsController < ApplicationController
  before_action :logged_in_user, only: [:show, :new, :create]
  helper_method :sort_column, :sort_direction, :filter_type

  def index
    if params[:"srch-term"]
      @groups = Group.search(params[:"srch-term"]).order("created_at DESC").paginate(page: params[:page], :per_page => 15)
    else
      @groups = Group.paginate(page: params[:page], :per_page => 15)
    end
  end

  def show
    @group = Group.find(params[:id])
    @current_member = @group.members.find_by(user_id: current_user.id)
    @tasks = @group.tasks.paginate(page: params[:page], :per_page => 15)
    if admin?(@group)
      @members = @group.members.paginate(page: params[:page], :per_page => 15)
    else
      @members = @group.members.where(pending: false).paginate(page: params[:page], :per_page => 15)
    end
    # @tasks = @group.tasks.order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 15)
    @active_tasks =  @group.tasks.where(active: true).order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 15)
    @unactive_tasks =  @group.tasks.where(active: false).order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 15)
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
      params.require(:group).permit(:name, :area, :description, :private)
    end

    def sort_column
      Task.column_names.include?(params[:sort]) ? params[:sort] : 'deadline'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
end
