class CreateJoinTableMallStore < ActiveRecord::Migration[5.0]
  def change
    create_join_table :malls, :stores do |t|
      # t.index [:mall_id, :store_id]
      # t.index [:store_id, :mall_id]
    end
  end
end
