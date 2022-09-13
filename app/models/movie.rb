class Movie < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :genre

  # Validations
  validates_presence_of :title, :description, :image_url, :release_date
  validates_uniqueness_of :title, :image_url
end
