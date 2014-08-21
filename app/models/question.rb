class Question < ActiveRecord::Base
  attr_accessible  :name, :custom_field_id,:options
  serialize :options
  belongs_to :survey
  belongs_to :custom_field
  has_many :answers, dependent: :destroy

  validates :name, presence: true
  validate :options_presence

  def options_presence
    if (custom_field.name == "Radio Button" or custom_field.name == "Check Box") && options.blank?
      errors.add(:options, "options can't be blank for this type")
    end
  end
  
end
