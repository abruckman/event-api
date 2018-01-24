class CreatePairings < ActiveRecord::Migration[5.1]
  def change
    create_table :pairings do |t|
      t.float :rating
      t.string :status

      t.timestamps
    end
  end
end
