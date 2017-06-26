class ChangeLearnedConceptIdtoIntegerInAssessmentInfos < ActiveRecord::Migration[5.0]
  def change
    remove_column :assessment_infos, :learned_concept_id
    add_column :assessment_infos, :learned_concept_id, :integer , null: :false
  end
end
