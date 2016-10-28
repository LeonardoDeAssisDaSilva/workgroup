module MembersHelper
  def member?(group)
    group.users.exists?(current_user)
  end
end
