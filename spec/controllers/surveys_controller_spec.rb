require 'rails_helper'

RSpec.describe SurveysController, :type => :controller do
  let(:valid_attributes) {
    skip({name: "Test Survey"})
  }

  let(:invalid_attributes) {
    skip({name: ""})
  }

  context "Admin login" do
    before { sign_in FactoryGirl.build(:user) }

    describe "GET index" do
      it "assigns all surveys to @surveys" do
        survey = Survey.create! valid_attributes
        get :index, {}
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
      xit "assigns a new survey as @survey" do
        # survey = Survey.new
        get :new, {}
        expect(assigns(:survey)).to be_a_new(survey)
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
        xit "creates a new survey" do
          expect {
            post :create, {:survey => valid_attributes}
            }.to change(survey, :count).by(1)
          end

          it "assigns a newly created survey as @survey" do
            post :create, {:survey => valid_attributes}
            expect(assigns(:survey)).to be_a(survey)
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
            expect(assigns(:survey)).to be_a_new(survey)
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
            skip({name: "Changed Name"})
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
            }.to change(survey, :count).by(-1)
          end

          it "redirects to the surveys list" do
            survey = Survey.create! valid_attributes
            delete :destroy, {:id => survey.to_param}
            expect(response).to redirect_to(surveys_path)
          end
        end


      end
    end
