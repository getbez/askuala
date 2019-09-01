class AddNumAnswersToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :num_of_answers, :integer
  end
end
