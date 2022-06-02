class AddPointsToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :points, :decimal, precision: 8, scale: 2, default: 0, null: false
  end
end
