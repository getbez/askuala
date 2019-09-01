class AddTitleToAssessment < ActiveRecord::Migration[6.0]
  def change
    add_column :assessments, :title, :string
  end
end
