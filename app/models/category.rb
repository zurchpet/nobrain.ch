class Category < ActiveRecord::Base
  has_many :blogs
  #belongs_to :parent_category, :class_name => "Category", :foreign_key => "parent_category"
  attr_accessible :name #:parent_category
end
