class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :description
      t.timestamps
    end
    
    add_index :goals, :title
  end
end
