class QuestionSerializer < ActiveModel::Serializer
  attributes \
    :id,
    :body,
    :submitted_by,
    :yes_vote_total,
    :current_user_yes_vote

  def submitted_by
    object.user.email
  end

  def current_user_yes_vote
    vote = object.votes.find_by(user_id: instance_options[:current_user])
    vote && vote.yes_vote
  end
end
