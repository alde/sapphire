json.array!(@adjustments) do |adjustment|
  json.extract! adjustment, 
  json.url adjustment_url(adjustment, format: :json)
end