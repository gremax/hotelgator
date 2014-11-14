class Hotel < ActiveRecord::Base
  validates :title,  presence: true
  validates :rating, presence: true
  validates :price,  presence: true

  belongs_to :user
  has_one    :address
  has_many   :comments
  accepts_nested_attributes_for :address, allow_destroy: true
  
  def full_address
    hotel = self.address
    if hotel
      "#{hotel.country} #{hotel.state} #{hotel.city} #{hotel.street}"
    else
      "unknown"
    end
  end
  
  def rating_calc
    comments_rating = Comment.where(hotel_id: self.id)
    comments_rating_sum = comments_rating.sum(:rating)
    rating = (self.rating + comments_rating_sum) / (comments_rating.count + 1)
  end
end
