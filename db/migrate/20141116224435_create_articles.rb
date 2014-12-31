class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :authors
      t.string :publication_name
      t.text :url
      t.text :description
      t.string :publication_date
      t.text :keywords
      t.string :genre
      t.boolean :unread, default: true

      t.timestamps
    end

    add_index :articles, :url, unique: true
  end
end
