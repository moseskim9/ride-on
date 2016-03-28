class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :make
      t.string :model
      t.string :engine
      t.string :year
      t.string :type
      t.integer :rate_daily
      t.string :bike_image
      t.references :location, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
