class Survey < ActiveRecord::Base
  attr_accessible :name
  has_many :questions, dependent: :destroy
  has_many :answers,dependent: :destroy
  
  validates :name, presence: true
end
