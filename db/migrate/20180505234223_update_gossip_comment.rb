class UpdateGossipComment < ActiveRecord::Migration[5.2]
  def change
  	add_column :gossips, :introduction, :text
  	remove_column :comments, :introduction
  end
end
