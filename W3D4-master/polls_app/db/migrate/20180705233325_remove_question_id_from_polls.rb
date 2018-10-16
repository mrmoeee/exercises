class RemoveQuestionIdFromPolls < ActiveRecord::Migration[5.1]
  def change
    remove_column :polls, :question_id, :integer
  end
end
