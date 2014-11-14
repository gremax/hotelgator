class Comment < ActiveRecord::Base
  validates  :text,   presence: true
  validates  :rating, presence: true
  validates  :user,   presence: true
  belongs_to :hotel
  belongs_to :user
end
