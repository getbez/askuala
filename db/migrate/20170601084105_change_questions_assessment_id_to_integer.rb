class ChangeQuestionsAssessmentIdToInteger < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions , :assessment_id
    add_column :questions, :assessment_id, :integer, null: false
  end
end
