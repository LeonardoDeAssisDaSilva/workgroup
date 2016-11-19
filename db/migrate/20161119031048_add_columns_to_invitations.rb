class AddColumnsToInvitations < ActiveRecord::Migration[5.0]
  def change
    add_column :invitations, :member_id, :integer
    add_column :invitations, :user_id, :integer
    add_column :invitations, :group_id, :integer
    add_column :invitations, :checked, :boolean
  end
end
