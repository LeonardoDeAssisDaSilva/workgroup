class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]

  def index
    @invitations = Invitation.all
  end

  def show
    @invitations = current_user.invitations.where(checked: false)
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
  end

  def update
  end

  def destroy
  end

  private

    def invitation_params
      params.require(:invitation).permit(:member_id, :user_id, :group_id, :checked)
    end
end
