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

  describe "GET #show" do
    context "with valid purchase id" do
      it "returns a purchase" do
        purchase = create(:purchase)
  
        get :show, params: { id: purchase.id }
        json = JSON.parse(response.body)
  
        expect(response).to be_successful
        expect(json['id']).to eq(purchase.id)
      end
    end

    context "with invalid purchase id" do
      it "raises a RecordNotFound exception" do
        expect { get :show, params: { id: 123 } }.to raise_error(ActiveRecord::RecordNotFound)
      end
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
      it 'does not create a purchase' do
        expect do
          post :create, params: { purchase: purchase_params.except(:user_id) }
        end.to change(Purchase, :count).by(0)
      end
    end

    context "when user already has the content" do
      it 'does not create a purchase if it still is available' do
        create(:purchase, user: user, purchase_option: purchase_option)

        post :create, params: { purchase: purchase_params }
        json = JSON.parse(response.body)

        expect(json['user_id'].first).to match(/user already has this content/)
        expect(Purchase.count).to eq(1)
      end

      it 'creates a purchase if it is not available' do
        purchase = create(:purchase, user: user, purchase_option: purchase_option)
        purchase.created_at = 3.days.ago
        purchase.save

        expect do
          post :create, params: { purchase: purchase_params }
        end.to change(Purchase, :count).by(1)
      end
    end
  end

end
