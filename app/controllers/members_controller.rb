class MembersController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    unless member?(params[:group_id])
      @member = current_user.members.build(group_id: params[:group_id],
                                           user_id: current_user.id,
                                           admin: false)
      if @member.save
        flash[:success] = "Novo membro adicionado."
        redirect_to group_path(params[:group_id])
      else
        flash[:danger] = "Por favor, tente novamente."
        #flash[:danger] = @member.inspect
        redirect_to group_path(params[:group_id])
      end
    end
  end

  def update
    member = Member.find(params[:id])
    if admin?(params[:group_id]) && member.update_attributes(admin: true)
      flash[:success] = "Operação realizada com sucesso."
      redirect_to Group.find(params[:group_id])
      return
    end
    flash[:danger] = "Você não possui autorização para realizar esta operação!"
    redirect_to Group.find(params[:group_id])
  end

  def destroy
    member = Member.find(params[:id])
    if current_user?(member.user) || admin?(params[:group_id])
      member.delete
      flash[:success] = "Operação realizada com sucesso."
      redirect_to request.referrer || root_url
    else
      flash[:danger] = "Você não possui autorização para realizar esta operação!"
      redirect_to member.group
    end
  end

  private

    def member_params
      params.require(:member).permit(:group, :user)
    end
end
