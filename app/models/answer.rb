class Answer < ActiveRecord::Base
  attr_accessible :question_id, :answers, :user_id
  serialize :answers
  belongs_to :question
  belongs_to :user
end
