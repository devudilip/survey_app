class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.integer :custom_field_id
      t.integer :survey_name_id
      t.text :options
      t.timestamps
    end
  end
end
