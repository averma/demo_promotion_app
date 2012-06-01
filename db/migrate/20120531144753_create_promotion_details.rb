class CreatePromotionDetails < ActiveRecord::Migration
  def change
    create_table :promotion_details do |t|
      t.integer :promotion_id
      t.integer :business_id
      t.integer :product_id
      t.timestamps
    end
  end
end
