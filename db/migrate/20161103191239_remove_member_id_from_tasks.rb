class RemoveMemberIdFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_reference :tasks, :member_id, index: true, foreign_key: true
  end
end
