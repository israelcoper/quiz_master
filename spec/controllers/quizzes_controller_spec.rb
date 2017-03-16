require 'rails_helper'

RSpec.describe QuizzesController, type: :controller do
  let(:user) { build_stubbed :user }
  let(:question) { build_stubbed :question }
  let(:quiz) { build_stubbed :quiz }

  let(:valid_attributes) { attributes_for :quiz }
  let(:invalid_attributes) { attributes_for :invalid_quiz }

  before :each do
    Quiz.stub(:find).with(quiz.id.to_s).and_return(quiz)
    quiz.stub(:save).and_return(true)
  end

  context "authorized access" do
    before :each do
      sign_in(user)
    end

    describe "quizzes#index" do
      before :each do
        Question.stub(:all).and_return([question])
        get :index
      end

      it "assigns all questions as @questions" do
        expect(assigns(:questions)).to match_array [question]
      end

      it "render the :index template" do
        expect(response).to render_template :index
      end
    end

    describe "quizzes#new" do
      before :each do
        get :new
      end

      it "assigns a new quiz" do
        expect(assigns(:quiz)).to be_new_record
        expect(assigns(:quiz)).to be_a_new(Quiz)
      end

      it "render the :new template" do
        expect(response).to render_template :new
      end
    end

    describe "quizzes#create" do
      context "with valid attributes" do
        before :each do
          post :create, params: { quiz: valid_attributes }
        end

        # it "creates a new quiz" do
        #   expect(Quiz.exists?(assigns(:quiz).id)).to be_truthy
        # end

        # it "redirects to quizzes#show" do
        #   expect(response).to redirect_to quiz_path(quiz.id)
        # end
      end

      context "with invalid attributes" do
        before :each do
          post :create, params: { quiz: invalid_attributes }
        end

        it "does not save the new quiz" do
          expect(Quiz.exists?(quiz.id)).to be_falsey
        end

        it "re-renders the :new method" do
          expect(response).to render_template :new
        end
      end
    end

    describe "quizzes#show" do
      before :each do
        get :show, params: { id: quiz.id }
      end
      
      it "assigns the requested quiz to @quiz" do
        expect(assigns(:quiz)).to eq quiz
      end

      it "render the :show template" do
        expect(response).to render_template :show
      end
    end

    describe "quizzes#results" do
      before :each do
        user.stub(:quizzes).and_return([quiz])
        get :results
      end

      it "assigns all current user quizzes to @quizzes" do
        expect(assigns(:quizzes)).to match_array [quiz]
      end

      it "render the :results template" do
        expect(response).to render_template :results
      end
    end

  end
end

