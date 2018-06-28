class ChangePrice < ActiveRecord::Migration[5.2]
  def change
    change_column :trades, :stock_price, :float
  end
end
