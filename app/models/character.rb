class Character < ActiveRecord::Base

  include CharactersHelper

  attr_accessor :dkp_spent, :dkp_earned

  def character_class
    CharacterClass.find_by_id(
      self[:character_class_id]
    ).name.downcase.gsub(' ', '_')
  end

  def dkp
    dkp_earned - dkp_spent
  end

  def style dkp
    return :negative if dkp < 0
    :positive
  end

  def dkp_earned
    if @dkp_earned.nil? then
      @dkp_earned = earned_dkp(
        self[:id],
        shares,
        adjustments.inject(0) { |sum, a| sum + a.shares }
      )
    end
    @dkp_earned
  end

  def dkp_spent
    if @dkp_spent.nil? then
      @dkp_spent = spent_dkp(self[:id])
    end
    @dkp_spent
  end

  def shares
    CharacterReward.where(
      character_id: self[:id]
    ).all.inject(0) do |sum, cr|
      sum ||= 0
      reward = Reward.find_by_id(cr.reward_id)
      sum + reward.number_of_shares unless reward.nil?
    end
  end

  def raids
    [
      {comment: "Maghaera HC", date:"2013-04-14 19:00"},
      {comment: "Horridon HC", date:"2013-04-13 19:00"}
    ]
  end

  def adjustments
    Adjustment.where(character_id: self[:id])
  end

  def attendance_short
    92.0
  end

  def attendance_long
    99.0
  end
end
