require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))

    roster = []

    names = doc.css(".student-name").collect {|v| name.text}
    location = doc.css(".student-location").collect {|v| location.text}
    profile_url = doc.css("div.student-card a").collect {|v| url['href']}

      i = 0
    while i < names.size
      roster << {:name => names[i], :location => location[i], :profile_url => profile_url[i]}
      i+=1
    end
    roster
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))

    profile = []

    social_sites = doc.css("a").collect {|v| v['ref']}

  end

end
