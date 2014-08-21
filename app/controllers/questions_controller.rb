class QuestionsController < ApplicationController

  def index
    @survey = Survey.find params[:survey_id]
    @questions = @survey.questions
  end
  
  def new
    @survey = Survey.find params[:survey_id]
    @question = @survey.questions.new
  end

  def create
    @survey = Survey.find params[:survey_id]
    @question = @survey.questions.new(params[:question])
    if @question.save
      redirect_to surveys_path
    else
      render 'new'
    end
  end

end
