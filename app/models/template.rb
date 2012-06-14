class Template < ActiveRecord::Base
  attr_accessible :content, :content_type, :lang

  belongs_to :task
end
