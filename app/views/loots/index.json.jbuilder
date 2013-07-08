json.array!(@loots) do |loot|
  json.extract! loot, 
  json.url loot_url(loot, format: :json)
end