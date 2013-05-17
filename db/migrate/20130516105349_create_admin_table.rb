class CreateAdminTable < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string "username", :limit => 25
      t.string "first_name", :limit => 25
      t.string "last_name", :limit => 50
      t.string "email", :default => "email address", :null => false
      t.string "hashed_password", :limit => 40
      t.string "salt", :limit =>40
      t.timestamps
    end
    
      add_index("admin_users", "username")
      add_index("admin_users", "first_name")
  end
end
