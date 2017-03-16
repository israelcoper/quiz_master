class QuizzesController < ApplicationController
  before_action :authenticate_user
  before_action :find_quiz, only: [:show]

  def index
    @questions = Question.all
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params.merge(user_id: current_user.id))
    if @quiz.save
      redirect_to quiz_path(@quiz), notice: "Question created successfully!"
    else
      render :new
    end
  end

  def show
  end

  def results
    @quizzes = current_user.quizzes
  end

  protected

  def quiz_params
    params.require(:quiz).permit(:question_id, :answer)
  end

  def find_quiz
    @quiz ||= Quiz.find(params[:id])
  end

end
