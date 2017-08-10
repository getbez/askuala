class AddTitleToAssessment < ActiveRecord::Migration[5.0]
  def change
    add_column :assessments, :title, :string
  end
end
