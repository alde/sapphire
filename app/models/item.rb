class Item < ActiveRecord::Base

  def tooltip difficulty
    if difficulty == :heroic
      WowheadParser.new.parse(self[:wowid_heroic])
    else
      WowheadParser.new.parse(self[:wowid_normal])
    end
  end

  def price difficulty
    return self[:price_normal] if difficulty == :normal
    self[:price_heroic]
  end

  def url difficulty
    base_url = "http://www.wowhead.com/item="

    return "#{base_url}#{self[:wowid_normal]}" if difficulty == :normal
    "#{base_url}#{self[:wowid_heroic]}"
  end

  def looters
    [
      {name: 'Codger', price: 5.0, heroic: true, raid: "Final 3 Bosses", date: DateTime.now}
    ]
  end

end
