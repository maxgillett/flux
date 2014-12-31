every 1.day, :at => '1:10am' do
  runner "Journal.all.each(&:index_new_articles)", environment: 'development'
end
