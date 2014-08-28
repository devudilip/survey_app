class Survey < ActiveRecord::Base
  attr_accessible :name
  has_many :questions, dependent: :destroy
  has_many :answers,dependent: :destroy
  has_many :survey_users
  has_many :users, through: :survey_users,dependent: :destroy, :uniq => true

  validates :name, presence: true
end
