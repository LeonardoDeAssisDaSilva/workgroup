module MembersHelper
  def member?(group)
    current_user.groups.exists?(group)
  end

  def admin?(group, user = current_user)
    if user == current_user
      current_user.members.find_by(group_id: group).admin? if member?(group)
    else
      user.admin?
    end
  end

  def pending?(member, group)
    Member.find(member.id).pending? if member?(group.id)
  end
end
