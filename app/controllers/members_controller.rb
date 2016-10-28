class MembersController < ApplicationController

  def index
    @members = Member.where("group_id = #{params[:group_id]}").paginate(page: params[:page])
  end

  def create
    group = Group.find(params[:group_id])
    unless member?(group)
      @member = current_user.members.create!(group: group, user: current_user, admin: true)
      if @member.save
        flash[:success] = "Novo membro adicionado."
        redirect_to group_path(params[:group_id])
      else
        flash[:warning] = "Por favor, tente novamente."
      end
    end
  end

  def destroy
    Member.find_by!(params[:group_id],current_user.id).delete
    flash[:success] = "Você deixou este grupo."
    redirect_to group_path
  end

  private

    def member_params
      params.require(:member).permit(:group, :user)
    end
end
