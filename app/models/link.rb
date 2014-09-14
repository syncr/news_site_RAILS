class Link < ActiveRecord::Base
  validates :url, presence: true
  has_many :comments
  has_many :votes
end
