class AddYearAndMonthToHousePriceIndices < ActiveRecord::Migration[5.0]
  def change
    add_column :house_price_indices, :year, :integer
    add_column :house_price_indices, :month, :string
  end
end
