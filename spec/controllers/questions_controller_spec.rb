require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do
  let(:custom_field) {CustomField.create!(name: "Text")}
  let(:valid_attributes) {
   {name: "Test Survey", custom_field_id: custom_field.id }
 }

 let(:invalid_attributes) {
  {name: "", custom_field_id: custom_field.id}
}

context "Logged In user" do

  before do
    @user = FactoryGirl.build(:user)
    sign_in @user
    @abilities = Ability.new(@user)
    Ability.stub(:new).and_return(@abilities)
    @survey = Survey.create!(name: "Text")
  end

  describe "GET index" do
    it "assigns all questions to @surveys which is related to @survey" do
      question = @survey.questions.create! valid_attributes
      get :index, {survey_id: @survey.id}
      expect(assigns(:questions)).to eq([question])
    end
  end

  describe "GET new" do
    it "assigns a new survey.question as @question" do
      get :new, {survey_id: @survey.id}
      expect(assigns(:question)).to be_a_new(Question)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      xit "creates a new question" do
        question = @survey.questions.create! valid_attributes
        post :create, {survey_id: @survey.id}
        expect(question).to change(Question, :count).by(1)
      end

      it "assigns a newly created question as @question" do
        post :create, {survey_id: @survey.id,:question => valid_attributes}
        expect(assigns(:question)).to be_a(Question)
        expect(assigns(:question)).to be_persisted
      end

      it "redirects to the created question" do
        post :create, {survey_id: @survey.id,:question => valid_attributes}
        expect(response).to redirect_to @survey
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved question as @question" do
        post :create, {survey_id: @survey.id,:question => invalid_attributes}
        expect(assigns(:question)).to be_a_new(Question)
      end

      it "re-renders the 'new' template" do
        post :create, {survey_id: @survey.id,:question => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

end    
end
