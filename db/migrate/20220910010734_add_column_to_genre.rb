class AddColumnToGenre < ActiveRecord::Migration[7.0]
  def change
    add_column :genres, :name, :string
  end
end
