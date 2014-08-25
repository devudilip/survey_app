class CreateSurveyUsers < ActiveRecord::Migration
  def change
    create_table :survey_users do |t|
      t.belongs_to :survey
      t.belongs_to :user
      t.timestamps
    end
  end
end
