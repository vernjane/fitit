class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :phone
      t.string :street_address
      t.string :unit_number
      t.string :city
      t.string :province
      t.string :postal
      
      t.timestamps
    end
  end
end
