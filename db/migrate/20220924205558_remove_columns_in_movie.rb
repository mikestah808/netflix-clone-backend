class RemoveColumnsInMovie < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :like, :boolean
    remove_column :movies, :dislike, :boolean
  end
end
