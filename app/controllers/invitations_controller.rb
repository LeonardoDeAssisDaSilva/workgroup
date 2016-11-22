class InvitationsController < ApplicationController

  def index
    @invitations = current_user.invitations.where(checked: false).paginate(page: params[:page], :per_page => 15)
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @member = Member.find(params[:member_id])
    @user_to = User.find(params[:user_id])

    #só envia um convite caso o usuário não possua um convite não visualizado
    #para o mesmo grupo, e se ele não estiver no grupo
    if !@user_to.groups.exists?(params[:group_id]) && !Invitation.where(user_id: params[:user_id]).where(group_id: params[:group_id]).where(checked: false).exists?
        @invitation = @member.invitations.build(member_id: @member.id,
                                                user_id: params[:user_id],
                                                group_id: params[:group_id],
                                                checked: false)
        @invitation.save
        flash[:success] = "Convite enviado"
    else
        flash[:danger] = "Convite não enviado"
    end
    redirect_to '/users'
  end

  def update
    invitation = Invitation.find(params[:id])
    @group = Group.find(invitation.group_id)

    invitation.update_attributes(checked: true)
    redirect_to group_members_path(@group), method: :post
  end

  def destroy
    invitation = Invitation.find(params[:id])
    invitation.delete
  end

  private

    def invitation_params
      params.require(:invitation).permit(:member_id, :user_id, :group_id, :checked)
    end
end
