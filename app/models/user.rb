class User < ApplicationRecord
     # Associations
    has_many :movies
    has_many :genres, through: :movies

    # Macro method 
    has_secure_password 

    # Validations 
    validates_presence_of :email, :password, :password_confirmation
    validates_uniqueness_of :email
end
