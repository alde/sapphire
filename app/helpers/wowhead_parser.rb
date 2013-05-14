class WowheadParser

  require 'nokogiri'
  require 'open-uri'

  def parse wowid
    doc = Nokogiri::XML(open("http://wwww.wowhead.com/item=#{wowid}&xml"))
    doc.xpath('//htmlTooltip').first.inner_text
  end

end
