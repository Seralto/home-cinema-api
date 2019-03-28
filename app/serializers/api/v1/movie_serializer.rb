module Api
  module V1
    class MovieSerializer < ActiveModel::Serializer
      attributes :id, :type, :title, :plot, :created_at

      def created_at
        object.created_at.to_time.strftime('%m/%d/%Y at %H:%M:%S')
      end
    end
  end
end

