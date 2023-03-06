class GenreSerializer < ActiveModel::Serializer
  require 'pry'
  attributes :id, :name

  has_many :movies 

end
