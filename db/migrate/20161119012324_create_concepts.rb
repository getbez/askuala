class CreateConcepts < ActiveRecord::Migration[6.0]
  def change
    create_table :concepts do |t|
      t.integer  :level , null: false
      t.string   :title
      t.integer   :course_id
    end
  end
end
