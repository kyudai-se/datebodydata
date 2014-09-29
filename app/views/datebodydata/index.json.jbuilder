json.array!(@datebodydata) do |datebodydatum|
  json.extract! datebodydatum, 
  json.url datebodydatum_url(datebodydatum, format: :json)
end