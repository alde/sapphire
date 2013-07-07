class Character < ActiveRecord::Base

  def character_class
    CharacterClass.find_by_id(self[:character_class_id]).name.downcase.gsub(' ', '_')
  end

  def dkp

    prng = Random.new
    prng.rand(-50.0..50.0).round(2)
  end

  def style dkp
    return :negative if dkp < 0
    :positive
  end

  def dkp_earned
    33
  end

  def dkp_spent
    23
  end

  def shares
    CharacterReward.find_by_id(self[:character_id])
  end

  def raids
    [
      {comment: "Maghaera HC", date:"2013-04-14 19:00"},
      {comment: "Horridon HC", date:"2013-04-13 19:00"}
    ]
  end

  def adjustments
    []
  end

  def attendance_short
    92.0
  end

  def attendance_long
    99.0
  end
end
