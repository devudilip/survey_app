class RenameColumnInQuestion < ActiveRecord::Migration
  def up
    rename_column :questions, :survey_name_id, :survey_id
  end

  def down
    rename_column :questions,  :survey_id,:survey_name_id
  end
end
