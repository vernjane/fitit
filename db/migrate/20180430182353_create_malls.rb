class CreateMalls < ActiveRecord::Migration[5.0]
  def change
    create_table :malls do |t|
      t.string :name
      t.string :address
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6 

      t.timestamps
    end
  end
end
