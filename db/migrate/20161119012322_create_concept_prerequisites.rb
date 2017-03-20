class CreateConceptPrerequisites < ActiveRecord::Migration
  def change
    create_table :concept_prerequisites do |t|
      t.integer  :concept_id , null: false
      t.integer  :prerequisite_id , null: false
    end

  end
end
