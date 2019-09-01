class AddQuestionIdToChoices < ActiveRecord::Migration[6.0]
  def change
    add_column :choices, :question_id, :integer
  end
end
