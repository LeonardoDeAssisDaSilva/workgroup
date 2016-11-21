class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @current_user_groups = current_user.groups
    if params[:"srch-term"]
      @users = User.where(activated: true).search(params[:"srch-term"]).order("created_at
        DESC").paginate(page: params[:page], :per_page => 15)
    else
      @users = User.where(activated: true).paginate(page: params[:page], :per_page => 15)
    end
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
  end

  def new
    if logged_in?
      redirect_to root_url
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email

      flash[:info] = "Por favor visite seu email para ativar sua conta."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Perfil atualizado"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,
                                   :course, :organization)
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
