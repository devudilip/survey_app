require 'rails_helper'

RSpec.describe Survey, :type => :model do

  context "Test for validations" do
    it { should validate_presence_of(:name) }
  end

  context "test for relations" do
    it { have_many(:questions)  }
    it { have_many(:answers)  }
  end

end
