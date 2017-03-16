require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }

    it { should validate_uniqueness_of :email }

    describe "passwords" do
      it "needs a password and confirmation to save" do
        user = build(:user, password: nil, password_confirmation: nil)
        expect(user).to_not be_valid

        user.password = "password"
        user.password_confirmation = ""
        expect(user).to_not be_valid

        user.password_confirmation = "password"
        expect(user).to be_valid
      end

      it "needs password and confirmation to match" do
        user = build(:user, password: "secret", password_confirmation: "scrt")
        expect(user).to_not be_valid
      end
    end

    describe "authentication" do
      let(:user) { create(:user) }

      it "authenticates with a correct password" do
        expect(user.authenticate("secret")).to be
      end

      it "does not authenticate with an incorrect password" do
        expect(user.authenticate("scrt")).to_not be
      end
    end
  end
end
