module GroupsHelper

  def group_tab
    %w[forum members configurations].include?(params[:tab]) ? params[:tab] : nil
  end
end
