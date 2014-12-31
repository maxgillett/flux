class Article < ActiveRecord::Base
  validates :url, uniqueness: true
  belongs_to :journal

  def mark_as_read
    update_attribute('read_status', true)
  end

  ActiveRecord::Base.connection.execute("SELECT set_limit(0.1);")
end
