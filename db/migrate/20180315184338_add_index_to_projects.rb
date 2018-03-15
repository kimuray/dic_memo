class AddIndexToProjects < ActiveRecord::Migration[5.1]
  def change
    add_index :projects, [:name, :user_id], unique: true
  end
end
