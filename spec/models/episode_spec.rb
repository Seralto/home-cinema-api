require 'rails_helper'

RSpec.describe Episode, type: :model do
  context "with valid params" do
    let(:season) { create(:season) }

    it "creates a valid episode" do
      subject = create(:episode)
      expect(subject).to be_valid
    end

    it "belongs to a season" do
      subject = create(:episode, season: season)
      expect(subject.season).to eq(season)
    end
  end

  context "with invalid params" do
    it "does not create an episode" do
      subject = build(:invalid_episode)
      expect(subject.valid?).to be_falsy
    end

    it "does not accept invalid season" do
      subject = build(:invalid_episode_season)
      expect(subject.valid?).to be_falsy
    end

    it "raises a RecordInvalid exception" do
      expect { create(:invalid_episode)}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end