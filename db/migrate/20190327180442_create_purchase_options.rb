class CreatePurchaseOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_options do |t|
      t.decimal :price, precision: 8, scale: 2
      t.string :quality
      t.references :content, foreign_key: true

      t.timestamps
    end
  end
end
