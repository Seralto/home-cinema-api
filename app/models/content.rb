class Content < ApplicationRecord
  validates :title, presence: true
  validates :plot, presence: true
  validates :type, presence: true
end
