class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :ancestry

      t.timestamps
    end
    add_index :comments, :ancestry
  end
end
