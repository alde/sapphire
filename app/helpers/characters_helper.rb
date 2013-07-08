module CharactersHelper
  def earned_dkp char_id, shares, adjustments
    0
  end

  def share_value
    shares = (total_shares + total_adjustments)
    (shares <= 0) ? 0 : (share_value / shares)
  end

  def spent_dkp char_id
    get_loots(char_id).inject(0) {|sum, p| sum + p.price}
  end

  ##
  # "SELECT SUM( number_of_shares ) as shares FROM rewards
  #   JOIN character_rewards ON character_rewards.reward_id = rewards.id
  #   JOIN characters ON character_rewards.character_id = characters.id
  #   AND characters.active = 1"
  def total_shares
    ActiveRecord::Base.connection.execute(
      "SELECT SUM( number_of_shares ) as shares FROM rewards
      JOIN character_rewards ON character_rewards.reward_id = rewards.id
      JOIN characters ON character_rewards.character_id = characters.id
      AND characters.active = 1"
    ).sum.first.to_f
  end

  def get_loots char_id
    Loot.where(character_id: char_id).all
  end
end
