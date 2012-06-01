class Promotion < ActiveRecord::Base
  attr_accessible :name, :start_date, :end_date, :title, :subtitle, :description, :redemption_detail
  has_many :promotion_details
  has_many :products, :through => :promotion_details
  has_many :businesses, :through => :promotion_details

  validates :name, :presence => true, :uniqueness => true
  validates :start_date, :end_date, :title, :presence => true
end
