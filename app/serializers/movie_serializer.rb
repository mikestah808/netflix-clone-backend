class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image_url, :release_date, :user_id, :genre_id

  belongs_to :genre
end
