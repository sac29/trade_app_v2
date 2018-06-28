class AddFkTrades < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :trades, :users, column: :user_id, primary_key: :id, on_update: :cascade, on_delete: :cascade
  end
end
