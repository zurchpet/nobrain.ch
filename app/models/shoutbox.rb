class Shoutbox < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user, :content
end
