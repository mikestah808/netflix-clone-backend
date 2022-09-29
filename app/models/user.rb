class User < ApplicationRecord
     # Associations
    has_many :movies
    has_many :genres, through: :movies

    # Macro method 
    has_secure_password 

    # Validations 
    validates :email, :password, :first_name, :last_name, presence: true
    validates :email, uniqueness: true
end
