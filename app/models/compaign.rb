class Compaign < ActiveRecord::Base
  attr_accessible :mailconfig_id, :interval_max, :interval_min, :status, :title

  has_many :tasks
  belongs_to :mailconfig
end
