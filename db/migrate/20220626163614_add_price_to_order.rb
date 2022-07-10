class AddPriceToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :points, :decimal, precision: 8, scale: 2, default: 0, null: false
  end
end
