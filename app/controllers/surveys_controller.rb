class SurveysController < ApplicationController

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
    redirect_to surveys_path
  end

end
