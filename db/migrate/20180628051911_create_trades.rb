class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.string :company_name, null: false
      t.decimal :stock_price, precision: 2
      t.integer :no_of_stocks
      t.boolean :has_share, null: false
      t.bigint :user_id, null: false

      t.timestamps
    end

    execute "ALTER TABLE trades ADD CONSTRAINT stock_price_check CHECK (stock_price>0)"
    execute "ALTER TABLE trades ADD CONSTRAINT stock_count CHECK (no_of_stocks>0)"
    execute "ALTER TABLE trades ADD CONSTRAINT company_name CHECK (LENGTH(company_name)>0)"
  end
end
