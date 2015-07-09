class AddWorksToStarMothers < ActiveRecord::Migration
  def change
    add_column :star_mothers, :works, :text
  end
end
