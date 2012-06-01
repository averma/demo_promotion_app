class Business < ActiveRecord::Base
  attr_accessible :name
  has_many :promotion_details
  has_many :promotions, :through => :promotion_details
  has_many :products
  validates :name, :presence => true
end
