require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do
  let(:custom_field) {CustomField.create!(name: "Text")}
  let(:survey) { FactoryGirl.build(:survey) }
  let(:valid_attributes) {
    skip({name: "Test Survey", custom_field_id: custom_field.id, survey_id: survey.id })
  }

  let(:invalid_attributes) {
    skip({name: "", custom_field_id: custom_field.id})
  }
  context "Logged In user" do
    before { sign_in FactoryGirl.build(:user) }

    describe "GET index" do
      it "assigns all questions to @surveys which is related to @survey" do
        question = survey.questions.create! valid_attributes
        get :index, {}
        expect(assigns(:questions)).to eq([question])
      end
    end

    describe "GET new" do
      xit "assigns a new survey.question as @question" do
        question = survey.questions.new
        get :new, {}
        expect(assigns(:question)).to eq([question])
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new question" do
          question = survey.questions.create! valid_attributes
          post :create, {}
          expect(question).to change(question, :count).by(1)
        end

        it "assigns a newly created question as @question" do
          post :create, {:question => valid_attributes}
          expect(assigns(:question)).to be_a(question)
          expect(assigns(:question)).to be_persisted
        end

        it "redirects to the created question" do
          post :create, {:question => valid_attributes}
          expect(response).to redirect_to(surveys_path)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved question as @question" do
          post :create, {:question => invalid_attributes}
          expect(assigns(:question)).to be_a_new(question)
        end

        it "re-renders the 'new' template" do
          post :create, {:question => invalid_attributes}
          expect(response).to render_template("new")
        end
      end
    end

  end    
end
