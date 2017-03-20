class CreateGradeLevels < ActiveRecord::Migration
  def change
    create_table :grade_level do |t|
      t.integer :grade
      t.float   :maxMark, null: false
      t.float   :minMark, null: false
    end
  end
end
