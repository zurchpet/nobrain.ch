class Blog < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :category
  attr_accessible :title, :content, :members_only, :category_id, :user_id
end
