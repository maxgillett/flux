class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :name
      t.string :current_issue
      t.boolean :subscribed, default: true

      t.timestamps
    end
  end
end
