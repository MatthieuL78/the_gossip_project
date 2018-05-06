class GossipsCommentsSetup < ActiveRecord::Migration[5.2]
  def change
  	create_table :gossips do |t|
  	  t.belongs_to :user, index: true
  	  t.string :name
  	  t.datetime :date
  	  t.string :content
  	end
  	create_table :comments do |t|
  	  t.belongs_to :gossip, index: true
  	  t.belongs_to :comment, index: true
  	  t.string :content
  	  t.datetime :date
  	end
  end
end
