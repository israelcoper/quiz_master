require 'rails_helper'

RSpec.describe Quiz, type: :model do
  context "associations" do
    it { should belong_to :user }
    it { should belong_to :question }
  end

  context "validations" do
    it { should validate_presence_of :answer }
  end

  context "constants" do
    describe "RESULT" do
      it { expect(Quiz::RESULT).to eq(%w{ CORRECT INCORRECT }) }
    end
  end
end
