class AddGoldenDataUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :golden_data_url, :string
  end
end
