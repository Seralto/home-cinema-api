require 'rails_helper'

RSpec.describe Api::V1::ContentsController, type: :controller do

  describe "GET #index" do
    let!(:movie1) { create(:movie) }
    let!(:movie2) { create(:movie) }
    let!(:season1) { create(:season) }
    let!(:season2) { create(:season) }
    let!(:episode1) { create(:episode, season: season2, number: 1) }

    context "/contents" do
      it "returns all contents ordered by creation date" do
        get :index
        json = JSON.parse(response.body)

        expect(response).to be_successful
        expect(json.size).to eq(4)
        expect(json.last['id']).to eq(season2.id)
      end
    end

    context "/movies" do
      it "returns all movies ordered by creation date" do
        get :index, params: { by_type: 'Movie' }
        json = JSON.parse(response.body)

        expect(response).to be_successful
        expect(json.size).to eq(2)
        expect(json.last['id']).to eq(movie2.id)
      end
    end

    context "/seasons" do
      it "returns all seasons ordered by creation date" do
        get :index, params: { by_type: 'Season' }
        json = JSON.parse(response.body)

        expect(response).to be_successful
        expect(json.size).to eq(2)
        expect(json.last['id']).to eq(season2.id)
      end

      it "returns all seasons with their respective episodes" do
        get :index, params: { by_type: 'Season' }
        json = JSON.parse(response.body)

        expect(response).to be_successful
        expect(json.first['episodes'].size).to eq(0)
        expect(json.last['episodes'].size).to eq(1)
      end

      it "returns seasons episodes ordered by number" do
        episode3 = create(:episode, season: season2, number: 3)
        episode2 = create(:episode, season: season2, number: 2)

        get :index, params: { by_type: 'Season' }
        json = JSON.parse(response.body)

        expect(response).to be_successful
        expect(json.last['episodes'].size).to eq(3)
        expect(json.last['episodes'].last['number']).to eq(episode3.number)
      end
    end
  end

  describe "#GET show" do
    context "/contents/1" do
      it "returns a specific content" do
        content = create(:content)
        
        get :show, params: { id: content.id }
        json = JSON.parse(response.body)
        
        expect(response).to be_successful
        expect(json['id']).to eq(content.id)
        expect(json['type']).to eq(content.type)
        expect(json['title']).to eq(content.title)
        expect(json['plot']).to eq(content.plot)
      end
    end

    context "/movies/1" do
      it "returns a specific movie" do
        movie = create(:movie)
        
        get :show, params: { id: movie.id }
        json = JSON.parse(response.body)
        
        expect(response).to be_successful
        expect(json['id']).to eq(movie.id)
        expect(json['type']).to eq('Movie')
        expect(json['title']).to eq(movie.title)
        expect(json['plot']).to eq(movie.plot)
      end
    end

    context "/seasons/1" do
      it "returns a specific season" do
        season = create(:season)
        
        get :show, params: { id: season.id }
        json = JSON.parse(response.body)
        
        expect(response).to be_successful
        expect(json['id']).to eq(season.id)
        expect(json['type']).to eq('Season')
        expect(json['title']).to eq(season.title)
        expect(json['plot']).to eq(season.plot)
      end
    end

    context "with invalid content id" do
      it "raises a RecordNotFound exception" do
        expect { get :show, params: { id: 123 } }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

end
