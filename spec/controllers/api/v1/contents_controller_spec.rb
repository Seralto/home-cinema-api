require 'rails_helper'

RSpec.describe Api::V1::ContentsController, type: :controller do

  describe "GET #index" do
    let!(:movie1) { create(:movie) }
    let!(:movie2) { create(:movie) }
    let!(:season1) { create(:season) }
    let!(:season2) { create(:season) }
    let!(:episode) { create(:episode, season: season2) }

    context "/contents" do
      it "returns all contents ordered by creation date" do
        get :index
        json = JSON.parse(response.body)
        expect(response).to be_success
        expect(json.size).to eq(4)
      end
    end

    context "/movies" do
      it "returns all movies ordered by creation date" do
        get :index, params: { by_type: 'Movie' }
        json = JSON.parse(response.body)
        expect(response).to be_success
        expect(json.size).to eq(2)
        expect(json.last['id']).to eq(movie2.id)
      end
    end

    context "/seasons" do
      it "returns all seasons ordered by creation date" do
        get :index, params: { by_type: 'Season' }
        json = JSON.parse(response.body)
        expect(response).to be_success
        expect(json.size).to eq(2)
        expect(json.last['id']).to eq(season2.id)
      end

      it "returns all seasons with their respective episodes" do
        get :index, params: { by_type: 'Season' }
        json = JSON.parse(response.body)
        expect(response).to be_success
        expect(json.first['episodes'].size).to eq(0)
        expect(json.last['episodes'].size).to eq(1)
      end
    end
  end

end
