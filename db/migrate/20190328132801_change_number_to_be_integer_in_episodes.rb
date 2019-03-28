class ChangeNumberToBeIntegerInEpisodes < ActiveRecord::Migration[5.2]
  def change
    change_column :episodes, :number, :integer
  end
end
