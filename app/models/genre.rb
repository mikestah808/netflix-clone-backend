class Genre < ApplicationRecord
     # Associations
    has_many :movies 
    has_many :users, through: :movies

    #Validations 
    validates :genre, presence: true, uniqueness: true
end
