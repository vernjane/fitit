class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.text :description
      t.string :color
      t.string :size
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
