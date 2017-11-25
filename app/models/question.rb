class Question < ApplicationRecord
  belongs_to :user
  has_many :votes

  class << self
    def sorted_by_yes_votes
      # use user_id for the yes_count so that it displays in console
      select("COUNT(*) AS user_id")
        .select(:id, :body)
        .joins(:votes)
        .where("yes_vote = true")
        .group(:id)
        .order("user_id DESC")
    end
  end
end
