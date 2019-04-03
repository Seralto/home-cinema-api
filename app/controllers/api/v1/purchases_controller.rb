module Api
  module V1
    class PurchasesController < ApplicationController
      before_action :get_user, only: [:create]

      has_scope :active, type: :boolean, default: true
      has_scope :ordered, type: :boolean, default: true
      has_scope :page, default: 1

      def index
        @purchases = apply_scopes(Purchase).all.includes(:user, purchase_option: :content)
        render json: @purchases if stale?(@purchases)
      end

      def create
        @purchase = @user.purchases.new(purchase_params)

        if @purchase.save
          return render json: @purchase, status: :created
        else
          render json: @purchase.errors, status: :unprocessable_entity
        end
      end

      def show
        @purchase = apply_scopes(Purchase).find(params[:id])
        render json: @purchase if stale?(@purchase)
      end

      private

      def get_user
        return render json: { error: 'user_id is required' }, status: :forbidden unless purchase_params[:user_id]
        @user = User.find(purchase_params[:user_id])
      end

      def purchase_params
        params.require(:purchase).permit(:user_id, :purchase_option_id)
      end
    end
  end
end