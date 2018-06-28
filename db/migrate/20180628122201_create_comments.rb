class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment, null: false
      t.bigint :user_id, null: false
      t.bigint :trade_id, null:false

      t.timestamps
    end
    execute "ALTER TABLE comments ADD CONSTRAINT comments_check CHECK ( LENGTH(comment)>0 )"
    add_foreign_key :comments, :users, column: :user_id, primary_key: :id, on_update: :cascade, on_delete: :cascade
    add_foreign_key :comments, :trades, column: :trade_id, primary_key: :id, on_update: :cascade, on_delete: :cascade
  end
end
