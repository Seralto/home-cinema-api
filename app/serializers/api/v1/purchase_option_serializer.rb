module Api
  module V1
    class PurchaseOptionSerializer < ActiveModel::Serializer
      attributes :id, :price, :quality, :content

      def content
        { id: object.content.id, title: object.content.title, plot: object.content.plot }
      end
    end
  end
end
