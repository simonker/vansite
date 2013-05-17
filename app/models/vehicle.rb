class Vehicle < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :admin_users
end
