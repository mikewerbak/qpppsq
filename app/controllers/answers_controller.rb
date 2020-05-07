class AnswersController < ApplicationController
  before_action { @question = Question.find(params[:question_id]) }
  before_action :load_answer, only: [:edit, :show, :update, :destroy ]
  def index
    @aintswers = Answer.all
  end

  def new
    @aintswer = @question.answers.new
  end

  def edit

  end

  def update
    if @aintswer.update(answer_params)
      redirect_to question_answer_path(@question, @aintswer)
    else
      render :edit
    end
  end

  def show

  end

  def create
    @aintswer = @question.answers.new(answer_params)

    if @aintswer.save
      # render json: @question.to_json
      redirect_to question_answer_path(@question, @aintswer)
    else
      render :new
    end
  end

  def destroy
    @aintswer.destroy
    redirect_to question_answer_path
  end


  private

  def load_answer
    @aintswer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer_data).permit(:body)
  end
end
