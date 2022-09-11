class Movie < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :genre

  # Validations
  validates_presence_of :title, :description, :image_url, :release_date
end
