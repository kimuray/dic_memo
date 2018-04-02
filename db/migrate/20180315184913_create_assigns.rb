class CreateAssigns < ActiveRecord::Migration[5.1]
  def change
    create_table :assigns do |t|
      t.references :user, foreign_key: true, index: true, null: false
      t.references :project, foreign_key: true, index: true, null: false

      t.timestamps
    end
    add_index :assigns, [:user_id, :project_id], unique: true
  end
end
