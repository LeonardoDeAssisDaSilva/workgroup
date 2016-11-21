class AddTaskToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :task, foreign_key: true
  end
end
