class AddExtraFieldsToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :baby_name, :string
    add_column :attendances, :baby_age, :integer
    add_column :attendances, :mother_name, :string
    add_column :attendances, :wechat_id, :string
    add_column :attendances, :event_time, :string

    remove_column :attendances, :children_number, :integer
    remove_column :attendances, :adults_number, :integer
    remove_column :attendances, :username, :string
    remove_column :attendances, :email, :string
  end
end
