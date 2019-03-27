class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title
      t.text :plot
      t.string :type

      t.timestamps
    end
  end
end
