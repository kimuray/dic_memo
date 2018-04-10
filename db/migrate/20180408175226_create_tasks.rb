class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :user, index: true, null: false
      t.text :content, null: false
      t.integer :position, null: false
      t.date :expired_on, null: false, default: ""
      t.timestamps
    end
  end
end
