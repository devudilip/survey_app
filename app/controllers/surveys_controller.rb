class SurveysController < ApplicationController
  load_and_authorize_resource
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find params[:id]
  end

  def new
    @survey = Survey.new
  end

  def edit
    @survey = Survey.find params[:id]
  end

  def create
    @survey = Survey.new params[:survey]
    if @survey.save
      flash[:notice] = 'Survey successfully created.'
      redirect_to surveys_path 
    else
      flash[:error] = 'Survey creation failed.'
      render "new" 
    end
  end

  def update
    @survey = Survey.find params[:id]
    if @survey.update_attributes params[:survey]
      flash[:notice] = 'Survey successfully updated.'
      redirect_to surveys_path
    else
      flash[:error] = 'Survey update failed.'
      render "edit"
    end
  end

  def destroy
    @survey = Survey.find params[:id]
    @survey.destroy
    flash[:error] = 'Survey deleted successfully.'
    redirect_to surveys_path
  end

  def user_survey
    @survey = Survey.find params[:id]
    @user = User.find params[:user_id]  
    @survey_answers = @user.answers.where(survey_id: @survey.id)
  end

end
