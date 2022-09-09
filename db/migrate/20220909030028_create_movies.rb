class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.string :description
      t.string :image_url
      t.integer :release_date
      t.boolean :like
      t.boolean :dislike
      t.integer :user_id
      t.integer :genre_id
      # t.belongs_to :user, null: false, foreign_key: true
      # t.belongs_to :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
