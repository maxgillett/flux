class AddReadStatusToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :read_status, :boolean
  end
end
