json.array!(@courses) do |course|
  json.extract! course, :id, :name, :acronym, :academic_unit_id, :teacher_id, :semester_references
  json.url course_url(course, format: :json)
end
