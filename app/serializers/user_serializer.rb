class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :first_name, :last_name, :genres

  has_many :movies
  has_many :genres, through: :movies
end
