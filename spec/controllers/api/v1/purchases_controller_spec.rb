require 'rails_helper'

RSpec.describe Api::V1::PurchasesController, type: :controller do

  describe "GET #index" do
    it "returns all purchases" do
      purchase = create(:purchase)

      get :index
      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json.size).to eq(1)
      expect(json.last['id']).to eq(purchase.id)
    end
  end

  describe "GET #create" do
    let(:user) { create(:user) }
    let(:purchase_option) { create(:purchase_option) }
    let(:purchase_params) {
      { user_id: user.to_param, purchase_option_id: purchase_option.to_param }
    }

    context "with valid params" do
      it 'creates a purchase' do
        expect do
          post :create, params: { purchase: purchase_params }
        end.to change(Purchase, :count).by(1)
      end
    end

    context "with invalid params" do

    end
  end

end
