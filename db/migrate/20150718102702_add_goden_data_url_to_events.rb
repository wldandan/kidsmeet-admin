class AddGodenDataUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :goden_data_url, :string
  end
end
