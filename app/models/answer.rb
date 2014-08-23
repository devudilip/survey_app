class Answer < ActiveRecord::Base
  attr_accessible :question_id, :answers, :user_id
  serialize :answers
  belongs_to :question
  belongs_to :user

  scope :survey_answers, lambda { |survey| where(survey_id: survey.id) }
end
