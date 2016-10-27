class MembersController < ApplicationController

  def index
    @members = Member.where("group_id = 1").paginate(page: params[:page])
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      flash[:success] = "Novo membro adicionado."
    else
      flash[:warning] = "Por favor, tente novamente."
    end
  end

  private

    def member_params
      params.require(:member).permit(:group, :user)
    end
end
