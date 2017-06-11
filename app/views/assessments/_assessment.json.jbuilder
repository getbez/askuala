json.extract! assessment, :id, :level, :min_passing_grade, :concept_id, :created_at, :updated_at
json.url assessment_url(assessment, format: :json)
