class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :startDate
      t.string :endDate
      t.string :latitude
      t.string :longitude
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false

      t.timestamps
    end
  end
end
