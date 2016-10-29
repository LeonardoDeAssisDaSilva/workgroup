module MembersHelper
  def member?(group)
    current_user.groups.exists?(group)
  end
end
