class AddColumnVoteStatus < ActiveRecord::Migration
  def change
    add_column(:votes, :vote_status, :integer)
  end
end
