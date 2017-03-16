require 'rails_helper'

RSpec.describe Admin::QuestionsController, type: :controller do
  let(:admin) { build_stubbed :admin }
  let(:question) { build_stubbed :question }

  let(:valid_attributes) { attributes_for :question }
  let(:invalid_attributes) { attributes_for :invalid_question }

  before :each do
    Question.stub(:find).with(question.id.to_s).and_return(question)
    question.stub(:save).and_return(true)
  end

  context "authorized access" do
    before :each do
      sign_in(admin)
    end

    describe "questions#index" do
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

    describe "questions#show" do
      before :each do
        get :show, params: { id: question.id }
      end
      
      it "assigns the requested question to @question" do
        expect(assigns(:question)).to eq question
      end

      it "render the :show template" do
        expect(response).to render_template :show
      end
    end

    describe "questions#new" do
      before :each do
        get :new
      end

      it "assigns a new question" do
        expect(assigns(:question)).to be_new_record
        expect(assigns(:question)).to be_a_new(Question)
      end

      it "render the :new template" do
        expect(response).to render_template :new
      end
    end

    describe "questions#edit" do
      before :each do
        get :edit, params: { id: question.id } 
      end

      it "assigns the requested question to @question" do
        expect(assigns(:question)).to eq question
      end

      it "renders the :edit template" do
        expect(response).to render_template :edit
      end
    end

    describe "questions#create" do
      context "with valid attributes" do
        before :each do
          post :create, params: { question: valid_attributes }
        end

        it "creates a new question" do
          expect(Question.exists?(assigns(:question).id)).to be_truthy
        end

        it "redirects to questions#index" do
          expect(response).to redirect_to admin_questions_path
        end
      end

      context "with invalid attributes" do
        before :each do
          post :create, params: { question: invalid_attributes }
        end

        it "does not save the new question" do
          expect(Question.exists?(question.id)).to be_falsey
        end

        it "re-renders the :new method" do
          expect(response).to render_template :new
        end
      end
    end

    describe "questions#update" do
      context "with valid attributes" do
        before :each do
          # question.stub(:update).with(valid_attributes.stringify_keys).and_return(true)
          expect_any_instance_of(Question).to receive(:update).with(ActionController::Parameters.new(valid_attributes).permit(:content, :answer))
          put :update, params: { id: question.id, question: valid_attributes }
        end

        it "updates the requested question" do
          expect(assigns(:question)).to eq question
        end

        # it "redirects to questions#index" do
        #   expect(response).to redirect_to questions_path
        # end
      end

      context "with invalid attributes" do
        before :each do
          # question.stub(:update).with(invalid_attributes.stringify_keys).and_return(false)
          expect_any_instance_of(Question).to receive(:update).with(ActionController::Parameters.new(invalid_attributes).permit(:content, :answer))
          put :update, params: { id: question.id, question: invalid_attributes }
        end

        it "locates the requested question" do
          expect(assigns(:question)).to eq question
        end

        it "does not change question's attributes" do
          expect(assigns(:question).attributes).to eq question.attributes
        end

        it "re-renders the :edit template" do
          expect(response).to render_template :edit
        end
      end
    end

    describe "questions#destroy" do
      before :each do
        question.stub(:destroy).and_return(true)
        delete :destroy, params: { id: question.id }
      end

      it "deletes the question" do
        expect(Question.exists?(question.id)).to be_falsey
      end

      it "redirects to questions#index" do
        expect(response).to redirect_to admin_questions_path
      end
    end
  end

end
