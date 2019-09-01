class CreateAssessmentInfos < ActiveRecord::Migration[6.0]
 def change
   create_table :assessment_infos do |t|
     t.datetime :end_time
     t.string :learned_concept_id
     t.float :result
     t.datetime :start_time
     t.string :assessment_id
     t.string :student_user_id
   end
 end
end
