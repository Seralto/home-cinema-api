module Api
  module V1
    class ContentsController < ApplicationController
      has_scope :by_type
      has_scope :ordered, type: :boolean, default: true

      def index
        @contents = apply_scopes(Content)
        render json: @contents if stale?(@contents)
      end
    end
  end
end

