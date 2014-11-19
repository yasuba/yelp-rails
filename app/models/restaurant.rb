class Restaurant < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "thumb/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :reviews, dependent: :destroy
  validates :name, length: {minimum: 3, message: "The restaurant name is too short"},
  uniqueness: {message: "Restaurants must have a unique name"}

  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  end

end
