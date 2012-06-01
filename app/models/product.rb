class Product < ActiveRecord::Base
  attr_accessible :name, :business_id, :retail_price, :discounted_price
  has_many :promotion_details
  has_many :promotions, :through => :promotion_details
  belongs_to :business
  validates :name, :presence => true
  validates :business_id, :retail_price, :presence => true
end
