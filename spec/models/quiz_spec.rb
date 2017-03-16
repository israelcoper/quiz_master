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

  context "instance methods" do
    describe "result" do
      let(:quiz_1) { build_stubbed :quiz }
      let(:quiz_2) { build_stubbed :quiz, answer: "twenty six" }
      let(:quiz_3) { build_stubbed :quiz, answer: "25" }
      let(:quiz_4) { build_stubbed :quiz, answer: "twenty five" }

      it "returns correct result" do
        expect(quiz_1.result).to eq(Quiz::RESULT[0])
        expect(quiz_2.result).to eq(Quiz::RESULT[0])
      end

      it "returns incorrect result" do
        expect(quiz_3.result).to eq(Quiz::RESULT[1])
        expect(quiz_4.result).to eq(Quiz::RESULT[1])
      end
    end
  end

end
