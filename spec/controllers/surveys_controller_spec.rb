require 'rails_helper'

describe SurveysController, :type => :controller do

  let(:valid_attributes) {
    {name: "Test Survey"}
  }

  let(:invalid_attributes) {
    {name: ""}
  }

  context "Admin login" do
    before do
      @user = FactoryGirl.build(:user)
      sign_in @user
      @abilities = Ability.new(@user)
      Ability.stub(:new).and_return(@abilities)
    end


  describe "GET index" do
    it "assigns all surveys to @surveys" do
      survey = Survey.create! valid_attributes
      get :index
      expect(assigns(:surveys)).to eq([survey])
    end
  end


  describe "GET show" do
    it "Assigns object to @survey" do
      survey = Survey.create! valid_attributes
      get :show, {:id => survey.id}
      expect(assigns(:survey)).to eq(survey)
    end
  end

  describe "GET new" do
    it "assigns a new survey as @survey" do
      get :new
      expect(assigns(:survey)).to be_a_new(Survey)
    end
  end

  describe "GET edit" do
    it "assigns the requested survey as @survey" do
      survey = Survey.create! valid_attributes
      get :edit, {:id => survey.to_param}
      expect(assigns(:survey)).to eq(survey)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new survey" do
        post :create
        expect { survey = Survey.create! valid_attributes }.to change{ Survey.count }.by(1)
      end

      it "assigns a newly created survey as @survey" do
        post :create, {:survey => valid_attributes}
        expect(assigns(:survey)).to be_a(Survey)
        expect(assigns(:survey)).to be_persisted
      end

      it "redirects to the created survey" do
        post :create, {:survey => valid_attributes}
        expect(response).to redirect_to(surveys_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved survey as @survey" do
        post :create, {:survey => invalid_attributes}
        expect(assigns(:survey)).to be_a_new(Survey)
      end

      it "re-renders the 'new' template" do
        post :create, {:survey => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end
  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {name: "Changed Name"}
      }

      it "updates the requested survey" do
        survey = Survey.create! valid_attributes
        put :update, {:id => survey.to_param, :survey => new_attributes}

      end

      it "assigns the requested survey as @survey" do
        survey = Survey.create! valid_attributes
        put :update, {:id => survey.to_param, :survey => valid_attributes}
        expect(assigns(:survey)).to eq(survey)
      end

      it "redirects to the survey" do
        survey = Survey.create! valid_attributes
        put :update, {:id => survey.to_param, :survey => valid_attributes}
        expect(response).to redirect_to(surveys_path)
      end
    end

    describe "with invalid params" do
      it "assigns the survey as @survey" do
        survey = Survey.create! valid_attributes
        put :update, {:id => survey.to_param, :survey => invalid_attributes}
        expect(assigns(:survey)).to eq(survey)
      end

      it "re-renders the 'edit' template" do
        survey = Survey.create! valid_attributes
        put :update, {:id => survey.to_param, :survey => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested survey" do
      survey = Survey.create! valid_attributes
      expect {
        delete :destroy, {:id => survey.to_param}
        }.to change(Survey, :count).by(-1)
      end

      it "redirects to the surveys list" do
        survey = Survey.create! valid_attributes
        delete :destroy, {:id => survey.to_param}
        expect(response).to redirect_to(surveys_path)
      end
    end


  end
end
