class CreateGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :genres do |t|
      t.string :action
      t.string :comedy
      t.string :drama
      t.string :horror
      t.string :romance
      t.string :thriller

      t.timestamps
    end
  end
end
