
require 'rails_helper'

RSpec.describe Movie, type: :model do
  context "with valid params" do
    it "creates a valid movie" do
      subject = create(:movie)
      expect(subject).to be_valid
      expect(subject.type).to eq('Movie')
    end
  end

  context "with invalid params" do
    it "does not create a movie" do
      subject = build(:invalid_content, type: 'Movie')
      expect(subject.valid?).to be_falsy
    end

    it "raises a RecordInvalid exception" do
      expect { create(:invalid_content, type: 'Movie') }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end