class AddColumnCompleteGoals < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :completed, :string, default: 'N', null: false
    add_index :goals, :completed 
  end
end
