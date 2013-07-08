json.array!(@rewards) do |reward|
  json.extract! reward, 
  json.url reward_url(reward, format: :json)
end