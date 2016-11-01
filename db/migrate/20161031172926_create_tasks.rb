class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :member_id, foreign_key: true
      t.string :title
      t.integer :priority
      t.datetime :deadline
      t.text :description

      t.timestamps
    end
  end
end
