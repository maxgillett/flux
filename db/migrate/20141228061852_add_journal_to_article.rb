class AddJournalToArticle < ActiveRecord::Migration
  def change
    add_reference :articles, :journal, index: true
  end
end
