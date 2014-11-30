class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :agent_id
      t.string :title
      t.string :category
      t.string :abstract
      t.text :content
      t.string :main_image_url
      t.datetime :start_time
      t.datetime :end_time
      t.string :contact_phone
      t.string :address
      t.boolean :is_published, :default => true
      t.timestamps
    end

    add_index :events, :title
    add_index :events, :contact_phone
  end
end
