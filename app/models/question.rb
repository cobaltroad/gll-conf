class Question < ApplicationRecord
  belongs_to :user
  has_many :votes

  class << self
    def with_votes
      select(:id, :body, :user_id)
        .select("COUNT(yes_votes.id) AS yes_vote_total")
        .select("COUNT(no_votes.id)  AS no_vote_total")
        .joins("LEFT JOIN votes AS yes_votes ON yes_votes.question_id = questions.id AND yes_votes.yes_vote = true")
        .joins("LEFT JOIN votes AS no_votes ON no_votes.question_id = questions.id AND no_votes.yes_vote = false")
        .group(:id)
    end
  end
end
