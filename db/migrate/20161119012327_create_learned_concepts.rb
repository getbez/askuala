class CreateLearnedConcepts < ActiveRecord::Migration
  def change
    create_table  :learned_concepts do |t|
      t.integer   :learned_course_id
      t.datetime  :end_time
      t.datetime  :start_time
      t.integer   :concept_id
      t.integer    :resource_id
      t.boolean   :completed ,null: false
    end
  end
end
