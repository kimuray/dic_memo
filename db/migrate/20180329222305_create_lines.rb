class CreateLines < ActiveRecord::Migration[5.1]
  def change
    create_table :lines do |t|
      t.references :user, index: true, null: false
      t.references :project, index: true, null: false
      t.string :title, null: false
      t.integer :position, null: false
      t.timestamps
    end
  end
end
