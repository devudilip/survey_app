class QuestionsController < ApplicationController
load_and_authorize_resource
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
      redirect_to @survey
    else
      render 'new'
    end
  end

end
