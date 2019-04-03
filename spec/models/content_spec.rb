require 'rails_helper'

RSpec.describe Content, type: :model do
  context "with valid params" do
    it "creates a valid content" do
      subject = create(:content)
      expect(subject).to be_valid
    end

    it "can have a purchase_option" do
      subject = create(:content)
      subject.purchase_options.create(attributes_for(:purchase_option))
      expect(subject.purchase_options.count).to eq(1)
    end
  end

  context "with invalid params" do
    it "does not create a content" do
      subject = build(:invalid_content)
      expect(subject.valid?).to be_falsy
    end

    it "does not accept invalid type" do
      subject = build(:invalid_content_type)
      expect(subject.valid?).to be_falsy
    end

    it "raises a RecordInvalid exception" do
      expect { create(:invalid_content) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
