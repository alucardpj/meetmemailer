class Task < ActiveRecord::Base
  attr_accessible :from, :mailconfig_id, :status, :template_id, :to

  has_one :template
  has_one :mailconfig
  belongs_to :compaign
end
