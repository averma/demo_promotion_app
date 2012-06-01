class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :name, :null => false
      t.string :title, :null => false
      t.string :subtitle
      t.date :start_date, :null => false
      t.date :end_date, :null => false
      t.text :description
      t.text :redemption_detail
      t.timestamps
    end
  end
end
