class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :name
      t.string :location
      t.date :date
      t.time :time
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
