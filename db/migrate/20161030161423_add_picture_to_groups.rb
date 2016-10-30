class AddPictureToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :picture, :string
  end
end
