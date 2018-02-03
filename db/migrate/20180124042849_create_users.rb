class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :hashed_password
      t.string :description
      t.string :gender
      t.boolean :interested_m?
      t.boolean :interested_f?
      t.date :birthday
      t.string :education
      t.string :work

      t.timestamps
    end
  end
end
