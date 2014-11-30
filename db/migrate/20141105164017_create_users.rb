class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :phone_number

      t.timestamps
    end

    add_index :users, :username
    add_index :users, :email
  end
end
