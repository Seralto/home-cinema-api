require 'rails_helper'

RSpec.describe Purchase, type: :model do
  context "with valid params" do
    let(:user) { create(:user) }
    let(:purchase_option) { create(:purchase_option) }

    it "creates a valid purchase" do
      subject = create(:purchase)
      expect(subject).to be_valid
    end

    it "has an user" do
      subject = create(:purchase, user: user)
      expect(subject.user).to eq(user)
    end

    it "has a purchase_option" do
      subject = create(:purchase, purchase_option: purchase_option)
      expect(subject.purchase_option).to eq(purchase_option)
    end
  end

  context "with invalid params" do
    it "does not create a purchase" do
      subject = build(:invalid_purchase)
      expect(subject.valid?).to be_falsy
    end

    it "does not accept invalid user" do
      subject = build(:invalid_purchase_user)
      expect(subject.valid?).to be_falsy
    end

    it "does not accept invalid purchase_option" do
      subject = build(:invalid_purchase_option_reference)
      expect(subject.valid?).to be_falsy
    end

    it "raises a RecordInvalid exception" do
      expect { create(:invalid_purchase)}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
