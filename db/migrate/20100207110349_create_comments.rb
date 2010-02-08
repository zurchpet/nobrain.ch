class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :from, :class_name => "User"
      t.string :subject
      t.string :content
      t.references :blog
      t.references :parent
      t.timestamps
    end
  end
  
  def self.down
    drop_table :comments
  end
end
