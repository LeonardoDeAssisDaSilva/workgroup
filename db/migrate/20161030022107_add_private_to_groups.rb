class AddPrivateToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :private, :integer
  end
end
