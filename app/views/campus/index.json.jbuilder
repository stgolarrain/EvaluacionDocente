json.array!(@campus) do |campu|
  json.extract! campu, :id, :name
  json.url campu_url(campu, format: :json)
end
