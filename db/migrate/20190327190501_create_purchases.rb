class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.date :date
      t.references :user, foreign_key: true
      t.references :purchase_option, foreign_key: true

      t.timestamps
    end
  end
end