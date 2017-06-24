class Question < ApplicationRecord
  has_many :question_answers
  has_many :choices
  enum question_types: { multi_choice:0, straight_answer:1 }
end
