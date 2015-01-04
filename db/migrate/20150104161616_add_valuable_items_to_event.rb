class AddValuableItemsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :valuable_items, :text, :after => :content
  end
end
