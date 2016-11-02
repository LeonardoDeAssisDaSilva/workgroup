class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :priority, :string
  end
end
