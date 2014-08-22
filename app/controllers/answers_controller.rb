class AnswersController < ApplicationController
  def new
    @survey = Survey.find params[:survey_id]
    @answer = @survey.answers.new
  end

  def create
    @survey = Survey.find params[:survey_id]
    @answer = @survey.answers.new
    survey =  params[:survey]
    @answers = params[:survey].collect { |ans| @survey.answers.new(answers: ans.last, user_id: 1, question_id: ans.first) }
    # debugger
    if @answers.all?(&:valid?)
      @answers.each(&:save!)
      redirect_to surveys_path
    else
      render :action => 'new'
    end
  end
end
