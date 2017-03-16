class Admin::QuestionsController < ApplicationController
  before_action :authenticate_admin
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  layout "admin"

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to admin_questions_path, notice: "Question created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to admin_questions_path, notice: "Question updated succesfully!"
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_questions_path, notice: "Question destroyed successfully!"
  end

  protected

  def question_params
    params.require(:question).permit(:content, :answer)
  end

  def find_question
    @question ||= Question.find(params[:id])
  end

end
