class GenreSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :movies 
  # has_many :users, through: :movies
end
