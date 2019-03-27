require 'rails_helper'

RSpec.describe PurchaseOption, type: :model do
  context "with valid params" do
    let(:content) { create(:content) }

    it "creates a valid purchase_option" do
      subject = create(:purchase_option)
      expect(subject).to be_valid
    end

    it "belongs to a content" do
      subject = create(:purchase_option, content: content)
      expect(subject.content).to eq(content)
    end
  end

  context "with invalid params" do
    it "does not create an purchase_option" do
      subject = build(:invalid_purchase_option)
      expect(subject.valid?).to be_falsy
    end

    it "does not accept invalid content" do
      subject = build(:invalid_purchase_option_content)
      expect(subject.valid?).to be_falsy
    end

    it "raises a RecordInvalid exception" do
      expect { create(:invalid_purchase_option)}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
