class MembersController < ApplicationController

  def index
    @members = Member.paginate(page: params[:page])
  end

  private

    def member_params
      params.require(:member).permit(:group, :user)
    end
end
