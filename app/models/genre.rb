class Genre < ApplicationRecord
     # Associations
    has_many :movies 
    has_many :users, through: :movies

    #Validations 
    validates :name, presence: true, uniqueness: true
end
