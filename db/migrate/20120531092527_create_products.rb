class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :null => false
      t.integer :business_id, :null => false
      t.float :retail_price,  :null => false
      t.float :discounted_price, :default => 0
      t.timestamps
    end
  end
end
