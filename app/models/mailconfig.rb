class Mailconfig < ActiveRecord::Base
  attr_accessible :address, :authentication, :delivery_method, :password, :port, :user_name
end
