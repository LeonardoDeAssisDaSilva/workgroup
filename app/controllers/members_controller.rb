class MembersController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @members = Member.where("group_id = ?", params[:group_id]).paginate(page: params[:page])

  end

  def create
    unless member?(params[:group_id])
      @member = current_user.members.build(group_id: params[:group_id], user_id: current_user, admin: true)
      if @member.save
        flash[:success] = "Novo membro adicionado."
        redirect_to group_path(params[:group_id])
      else
        flash[:error] = "Por favor, tente novamente."
      end
    end
  end

  def destroy
    Member.find_by!(params[:group_id], current_user.id).delete
    flash[:success] = "Você deixou este grupo."
    redirect_to group_path
  end

  private

    def member_params
      params.require(:member).permit(:group, :user)
    end
end
