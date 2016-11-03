class AddGroupToTasks < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :group, foreign_key: true
  end
end
