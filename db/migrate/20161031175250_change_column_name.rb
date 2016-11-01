class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
     rename_column :tasks, :member_id_id, :member_id
  end
end
