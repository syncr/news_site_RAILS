class ChangeLinks < ActiveRecord::Migration
  def change
    add_column :links, :headline, :string
  end
end
