class Hotel < ActiveRecord::Base
  validates :title,  presence: true
  validates :rating, presence: true
  validates :price,  presence: true, numericality: { greater_than: 0 }

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
  
  def self.top
    self.order('rating desc').limit(5)
  end
end
