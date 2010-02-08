class Comment < ActiveRecord::Base
  belongs_to :blog
  belongs_to :from, :class_name => "User", :foreign_key => :from_id
  attr_accessible :from_id, :subject, :content, :blog_id, :parent
end
