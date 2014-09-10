class RemoveColumnFromLinks < ActiveRecord::Migration
  def change
    remove_column :links, :vote_count
  end
end
