module Api
  module V1
    class PurchaseSerializer < ActiveModel::Serializer
      attributes :id, :purchase_date, :remaing_days

      def purchase_date
        object.created_at.to_time.strftime('%m/%d/%Y')
      end

      def remaing_days
        ((::Purchase::ALIVE_TIME - (Time.now - object.created_at)).to_f / 3600 / 24).ceil
      end

      belongs_to :user
      belongs_to :purchase_option
    end
  end
end
