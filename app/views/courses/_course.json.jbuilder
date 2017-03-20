json.extract! course, :id, :allowed_time_gap, :description, :end_date, :passing_grade, :start_date, :title, :created_at, :updated_at
json.url course_url(course, format: :json)