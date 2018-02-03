class CreateInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :interests do |t|
      t.integer :interest_rank
      t.boolean :private?
      t.boolean :priority?
      t.belongs_to :user, index:true
      t.belongs_to :event, index:true

      t.timestamps
    end
  end
end
