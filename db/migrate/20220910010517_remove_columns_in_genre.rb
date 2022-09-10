class RemoveColumnsInGenre < ActiveRecord::Migration[7.0]
  def change
    remove_column :genres, :action, :string
    remove_column :genres, :comedy, :string
    remove_column :genres, :drama, :string
    remove_column :genres, :horror, :string
    remove_column :genres, :romance, :string
    remove_column :genres, :thriller, :string
  end
end
