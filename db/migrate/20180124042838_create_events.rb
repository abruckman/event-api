class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date_start
      t.date :date_end
      t.datetime :time_start
      t.datetime :time_end
      t.string :url
      t.string :source
      t.string :source_id
      t.string :image_url
      t.string :event_address
      t.float :event_longitude
      t.float :event_lattitude
      t.boolean :golden?

      t.timestamps
    end
  end
end
