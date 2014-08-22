require 'rails_helper'

RSpec.describe Question, :type => :model do

  context "options_presence custom validation" do
    xit "Should validate custom field" do
      question = FactoryGirl.build(:question)
      question.valid?
      question.errors[:options].should include (":Can't be blank for type #{custom_field.name}")
    end
  end

  context "Question relations" do
    it { belong_to(:custom_field) }
    it { belong_to(:survey) }
    it { have_many(:answers)  }
  end

end
