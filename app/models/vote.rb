class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  validates :link, uniqueness: { scope: :user_id,
    message: "Sorry only one vote per person" }
end
