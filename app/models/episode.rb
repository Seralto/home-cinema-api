class Episode < ApplicationRecord
  belongs_to :season

  validates :title, presence: true
  validates :plot, presence: true
  validates :number, presence: true
  validates :season, presence: true
end
