class ChangePrivateTypeInGroups < ActiveRecord::Migration[5.0]
  def change
    change_column :groups, :private, :boolean
  end
end
