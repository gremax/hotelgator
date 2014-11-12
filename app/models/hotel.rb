class Hotel < ActiveRecord::Base
  validates :title, presence: true
  validates :rating, presence: true
  validates :price, presence: true

  belongs_to :user
  has_one :address
  accepts_nested_attributes_for :address, allow_destroy: true
end
