class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :children_number
      t.integer :adults_number
      t.string :username
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
