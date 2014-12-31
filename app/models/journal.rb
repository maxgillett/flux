class Journal < ActiveRecord::Base
  serialize :current_issue
  has_many :articles

  def index_new_articles
    return if not out_of_date?
    if scraper.scrape(latest_issue)
      update_attribute :current_issue, latest_issue
    end
  end

  def out_of_date?
    latest_issue != current_issue
  end

  private

  def latest_issue
    scraper.latest_issue
  end

  def scraper
    name.remove(' ').constantize
  end
end
