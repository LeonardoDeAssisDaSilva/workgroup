module MembersHelper
  def member?(group)
    current_user.groups.exists?(group)
  end

  def admin?(group)
    current_user.members.find_by(group_id: group).admin? if member?(group)
  end

  def pending?(member, group)
    Member.find(member).pending? if member?(group)
  end
end
