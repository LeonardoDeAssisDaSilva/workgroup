class AddPendingToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :pending, :boolean
  end
end
