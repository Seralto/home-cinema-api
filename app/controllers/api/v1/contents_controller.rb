module Api
  module V1
    class ContentsController < ApplicationController
      has_scope :by_type
      has_scope :ordered, type: :boolean, default: true
      has_scope :page, default: 1

      def index
        @contents = apply_scopes(Content)
        render json: @contents if stale?(@contents)
      end

      def show
        @content = apply_scopes(Content).find(params[:id])
        render json: @content if stale?(@content)
      end
    end
  end
end

