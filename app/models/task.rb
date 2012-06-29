class Task < ActiveRecord::Base
  attr_accessible :from, :status, :template_id, :to
  belongs_to :compaign
  belongs_to :template
end
