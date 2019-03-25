require 'rails_helper'

RSpec.describe User, type: :model do
  context "with valid params" do
    it "creates a valid user" do
      subject = create(:user)
      expect(subject).to be_valid
    end
  end

  context "with invalid params" do
    it "does not creat a user" do
      user = build(:user, email: "invalid_email")
      expect(user.valid?).to be_falsy
    end

    it "raises a RecordInvalid exception" do
      expect { create(:user, email: "invalid_email")}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
