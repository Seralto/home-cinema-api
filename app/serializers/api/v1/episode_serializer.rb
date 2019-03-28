module Api
  module V1
    class EpisodeSerializer < ActiveModel::Serializer
      attributes :id, :title, :plot, :number
    end
  end
end

