class AddActiveToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :active, :boolean, default: true
  end
end
