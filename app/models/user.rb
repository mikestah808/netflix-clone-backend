class User < ApplicationRecord
    has_secure_password # macro method 
    has_many :movies
    has_many :genres, through: :movies
end
