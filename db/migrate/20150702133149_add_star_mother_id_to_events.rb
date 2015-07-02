class AddStarMotherIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :star_mother_id, :integer
  end
end
