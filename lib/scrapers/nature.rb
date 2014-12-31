require 'open-uri'
require 'nokogiri'
require 'json'

module Nature
  JOURNAL_ID = Journal.find_by_name('Nature').id

  def self.scrape(latest_issue)
    volume, number = latest_issue
    url = "http://www.nature.com/opensearch/request?queryType=prism&query=prism.number+%3D+#{number}+AND+prism.volume+%3D+#{volume}+AND+prism.publicationName+%3D+Nature&httpAccept=application/json&maximumRecords=500"
    buffer = open(url).read
    response = JSON.parse(buffer)
    create_articles(response)
  end

  def self.create_articles(json)
    entries = json['feed']['entry']
    entries.each do |entry|
      data = entry['sru:recordData']['pam:message']['pam:article']['xhtml:head']
      authors = data['dc:creator']
      keywords = data['dc:subject']
      Article.create(
        title:            data['dc:title'],
        description:      data['dc:description'],
        publication_name: data['prism:publicationName'],
        publication_date: data['prism:publicationDate'],
        authors:          (authors.present? && authors.join(', ')) || nil,
        keywords:         (keywords.present? && keywords.join(', ')) || nil,
        genre:            data['prism:genre'], 
        url:              data['prism:url'],
        journal_id:       JOURNAL_ID
      )
    end
  end

  # Returns [number, volume] of latest issue
  def self.latest_issue
    page = Nokogiri::HTML(open("http://www.nature.com/nature/current_issue.html"))
    raw_text = page.xpath("//div[contains(@class,'sub-inner')]/header/h1/span")[0].text()
    nums = /Volume (\d+) Number (\d+)/.match(raw_text)
    return [nums[1].to_i, nums[2].to_i]
  end
end
