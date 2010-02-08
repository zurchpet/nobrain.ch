class PrivateMessage < ActiveRecord::Base
  belongs_to :from, :class_name => "User", :foreign_key => :from_id
  attr_accessible :from, :to_id, :subject, :content, :new, :replyed_with
end
