class Mailconfig < ActiveRecord::Base
  attr_accessible :address, :authentication, :delivery_method, :password, :port, :user_name

  has_many :compaigns

  def name_with_initial
    user_name
  end
end
