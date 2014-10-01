class Review < ActiveRecord::Base
    validates :rating, inclusion: (1..5)

    belongs_to :restaurant
    has_many :endorsements
    
end
