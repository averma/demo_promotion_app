class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end
end
