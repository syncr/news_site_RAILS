class CreateTables < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.integer :vote_count

      t.timestamps
    end

    create_table :comments do |t|
      t.string :content
      t.belongs_to :link

      t.timestamps
    end
  end
end
