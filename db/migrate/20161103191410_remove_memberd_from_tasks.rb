class RemoveMemberdFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_reference :tasks, :member, index: true, foreign_key: true
  end
end
