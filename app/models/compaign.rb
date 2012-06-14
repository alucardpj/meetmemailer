class Compaign < ActiveRecord::Base
  attr_accessible :interval_max, :interval_min, :status, :title

  has_many :tasks
end
