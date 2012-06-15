class Template < ActiveRecord::Base
  attr_accessible :content, :content_type, :lang

  has_many :tasks
end
