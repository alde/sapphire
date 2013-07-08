json.array!(@character_rewards) do |character_reward|
  json.extract! character_reward, 
  json.url character_reward_url(character_reward, format: :json)
end