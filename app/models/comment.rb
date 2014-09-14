class Comment < ActiveRecord::Base
  validates :content, presence: true
  validates :link_id, presence: true
  belongs_to :user
  belongs_to :link
end
