class AddCommentsCountToTasks < ActiveRecord::Migration[5.0]
  def change
   change_table :tasks do |t|
     t.integer :comments_count, default: 0
   end

   reversible do |dir|
     dir.up { data }
   end
 end

 def data
   execute <<-SQL.squish
       UPDATE tasks
          SET comments_count = (SELECT count(1)
                                  FROM comments
                                 WHERE comments.task_id = tasks.id)
   SQL
 end
end
