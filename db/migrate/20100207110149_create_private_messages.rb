class CreatePrivateMessages < ActiveRecord::Migration
  def self.up
    create_table :private_messages do |t|
      t.references :from, :class_name => "User"
      t.references :to, :class_name => "User"
      t.string :subject
      t.string :content
      t.boolean :new
      t.references :replyed_with, :class_name => "PrivateMessage"
      t.timestamps
    end
  end
  
  def self.down
    drop_table :private_messages
  end
end
