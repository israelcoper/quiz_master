require 'rails_helper'
require 'numbers_in_words/duck_punch'

RSpec.describe Question, type: :model do
  context "validations" do
    it { should validate_presence_of :content }
    it { should validate_presence_of :answer }
  end

  context "instance methods" do
    describe "number_to_words" do
      let(:question) { build_stubbed :question, answer: "25" }

      it "convert number to words" do
        expect(question.number_to_words).to eq "twenty five"
      end
    end
  end
end
