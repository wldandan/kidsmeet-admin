class CreateStarMothers < ActiveRecord::Migration
  def change
    create_table :star_mothers do |t|
      t.string :name
      t.string :profession
      t.string :introduction
      t.timestamps
    end
  end
end
