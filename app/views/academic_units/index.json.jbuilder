json.array!(@academic_units) do |academic_unit|
  json.extract! academic_unit, :id, :name
  json.url academic_unit_url(academic_unit, format: :json)
end
