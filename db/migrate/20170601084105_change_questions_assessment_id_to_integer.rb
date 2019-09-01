class ChangeQuestionsAssessmentIdToInteger < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions , :assessment_id
    add_column :questions, :assessment_id, :integer, null: false
  end
end
