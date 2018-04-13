class AddLineIdToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :line_id, :int8, index: true
    add_foreign_key :tasks, :lines
  end
end
