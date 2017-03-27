class CreateConceptResources < ActiveRecord::Migration
  def change
    create_table  :concept_resources do |t|

      t.integer  :presentation_mode
      t.integer  :resource_type
      t.integer  :concept_id
    end
  end
end
