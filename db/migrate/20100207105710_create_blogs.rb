class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.references :user
      t.references :category
      t.string :title
      t.string :content
      t.boolean :members_only
      t.timestamps
    end
  end
  
  def self.down
    drop_table :blogs
  end
end
