require 'rails_helper'

RSpec.describe Season, type: :model do
  context "with valid params" do
    it "creates a valid season" do
      subject = create(:season)
      expect(subject).to be_valid
      expect(subject.type).to eq('Season')
    end
  end

  context "with invalid params" do
    it "does not create a season" do
      subject = build(:invalid_content, type: 'Season')
      expect(subject.valid?).to be_falsy
    end

    it "raises a RecordInvalid exception" do
      expect { create(:invalid_content, type: 'Season')}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end