class Season < Content
  has_many :episodes, -> { order('cast(number as unsigned) asc') }
end