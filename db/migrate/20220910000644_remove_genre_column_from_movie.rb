class RemoveGenreColumnFromMovie < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :genre, :string
  end
end
