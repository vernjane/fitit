class AddMallRefToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :mall, foreign_key: true
  end
end
