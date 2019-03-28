class RemoveDateFromPurchases < ActiveRecord::Migration[5.2]
  def change
    remove_column :purchases, :date, :date
  end
end
