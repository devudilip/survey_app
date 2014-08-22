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
      flash[:notice] = 'Question successfully created.'
      redirect_to @survey
    else
      flash[:error] = "Question creation failed."
      render 'new'
    end
  end

end
