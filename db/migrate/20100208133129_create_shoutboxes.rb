class CreateShoutboxes < ActiveRecord::Migration
  def self.up
    create_table :shoutboxes do |t|
      t.references :user
      t.text :content
      t.timestamps
    end
  end
  
  def self.down
    drop_table :shoutboxes
  end
end
