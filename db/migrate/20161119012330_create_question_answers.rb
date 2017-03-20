class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table  :question_answers do |t|
      t.integer  :choice_id
      t.text     :explanation
      t.string   :question_id
    end
  end
end
