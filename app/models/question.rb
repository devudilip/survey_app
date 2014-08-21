class Question < ActiveRecord::Base
  attr_accessible  :name, :custom_field_id,:options
  serialize :options
  belongs_to :survey
  belongs_to :custom_field
end
