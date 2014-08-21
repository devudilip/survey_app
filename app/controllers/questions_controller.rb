class QuestionsController < ApplicationController
  
  def index
    @survey = Survey.find params[:survey_id]
    @questions = @survey.questions
  end

end
