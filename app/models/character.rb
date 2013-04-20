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
end
