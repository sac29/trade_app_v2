class AddDate < ActiveRecord::Migration[5.2]
  def change
    add_column :trades, :action_date, :date
  end
end
