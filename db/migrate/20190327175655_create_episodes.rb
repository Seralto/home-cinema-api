class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :title
      t.text :plot
      t.integer :number
      t.references :season, index: true

      t.timestamps
    end

    add_foreign_key :episodes, :contents, column: :season_id
  end
end
