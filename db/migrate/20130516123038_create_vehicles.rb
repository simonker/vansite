class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.string "make", :limit => 25
      t.string "model", :limit => 25
      t.string "terms", :limit => 255
      t.string "sub_model", :limit => 255
      t.text "vehicle_description"
      t.text "deal_description"
      t.integer "weekly_price"
      t.integer "monthly_price"
      t.timestamps
    end
      add_index("vehicles", "model")
      add_index("vehicles", "make")
  end
  def self.down
    drop_table :vehicles
  end
end
