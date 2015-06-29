class AddStarMotherIdToAgent < ActiveRecord::Migration
  def change
    add_column :agents, :star_mother_id, :integer
  end
end
