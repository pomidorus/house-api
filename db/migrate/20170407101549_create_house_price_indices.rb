class CreateHousePriceIndices < ActiveRecord::Migration[5.0]
  def change
    create_table :house_price_indices do |t|
      t.date :date
      t.string :region_name
      t.decimal :index, precision: 14, scale: 9

      t.timestamps
    end
  end
end
