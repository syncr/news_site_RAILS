class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes_tables do |t|
      t.integer :link_id
      t.integer :user_id
    end
  end
end
