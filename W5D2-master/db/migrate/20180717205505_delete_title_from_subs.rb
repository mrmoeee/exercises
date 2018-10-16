class DeleteTitleFromSubs < ActiveRecord::Migration[5.1]
  def change
    remove_column :subs, :title
  end
end
