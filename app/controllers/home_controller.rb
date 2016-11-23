class HomeController < ApplicationController

  def index
    if logged_in?

      @current_user_groups = current_user.groups

      #Group Ranking by number of members
      @groups_members_ids = Member.all.group('group_id').count('group_id').sort_by {|hsh| hsh[1]}.reverse.slice(0..2)
      @groups_members = []
      for i in 0..@groups_members_ids.length - 1
        @groups_members = @groups_members + [Group.find(@groups_members_ids[i][0])]
      end

      #Group Ranking by number of tasks
      @groups_tasks_ids = Task.all.group('group_id').count('group_id').sort_by {|hsh| hsh[1]}.reverse.slice(0..2)
      @groups_tasks = []
      for i in 0..@groups_tasks_ids.length - 1
        @groups_tasks = @groups_tasks + [Group.find(@groups_tasks_ids[i][0])]
      end

      #User Ranking by number of tasks
      @users_tasks_ids = Task.all.group('user_id').count('user_id').sort_by {|hsh| hsh[1]}.reverse.slice(0..2)
      @users_tasks = []
      for i in 0..@users_tasks_ids.length - 1
        @users_tasks = @users_tasks + [User.find(@users_tasks_ids[i][0])]
      end
    end

  end
end
