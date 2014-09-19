class Link < ActiveRecord::Base
  validates :url, presence: true
  validates_uniqueness_of :url
  validates_presence_of :url
  validates_uniqueness_of :headline
  validates_presence_of :headline

  has_many :comments
  has_many :votes
end
