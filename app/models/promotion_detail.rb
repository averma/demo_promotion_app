class PromotionDetail < ActiveRecord::Base
   attr_accessible :promotion_id, :business_id, :product_id
   belongs_to :promotion
   belongs_to :business
   belongs_to :product
   validates :promotion_id, :business_id, :product_id, :presence => true
end
