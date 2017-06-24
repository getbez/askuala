json.extract! question, :id, :question_type, :question_string, :average_time, :difficulty_level_id, :assessment_id, :target_concept, :answer, :created_at, :updated_at
json.url question_url(question, format: :json)
