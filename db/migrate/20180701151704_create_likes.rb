class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.bigint :user_id
      t.bigint :trade_id
    end
    add_foreign_key :likes, :users, column: :user_id, primary_key: :id, on_update: :cascade, on_delete: :cascade
    add_foreign_key :likes, :trades, column: :trade_id, primary_key: :id, on_update: :cascade, on_delete: :cascade
  end
end
