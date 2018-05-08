class CreateSearchedLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :searched_locations do |t|
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
