class QuestionsController < ApplicationController
  load_and_authorize_resource
  def index
    @survey = Survey.find params[:survey_id]
    @users = @survey.users.includes(:answers).where('answers.survey_id = ? ', @survey.id)
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

  def edit
    @survey = Survey.find params[:survey_id]
    @question = Question.find params[:id]
  end

  def update
    @survey = Survey.find params[:survey_id]
    @question = Question.find params[:id]
    if @question.update_attributes params[:question]
      flash[:notice] = 'Question successfully updated.'
      redirect_to @survey
    else
      flash[:error] = 'Question update failed.'
      render "edit"
    end
  end

  def destroy
   @survey = Survey.find params[:survey_id]
   @question = Question.find params[:id]
   @question.destroy
   flash[:error] = 'Question deleted successfully.'
   redirect_to @survey
 end

end
