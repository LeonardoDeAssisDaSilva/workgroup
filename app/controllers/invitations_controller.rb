class InvitationsController < ApplicationController

  def index
    @invitations = current_user.invitations.where(checked: false)
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @member = Member.find(params[:member_id])
    @invitation = @member.invitations.build(member_id: @member.id,
                                            user_id: params[:user_id],
                                            group_id: params[:group_id],
                                            checked: false)
    @invitation.save
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
