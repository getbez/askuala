class AddNumAnswersToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :num_of_answers, :integer
  end
end
