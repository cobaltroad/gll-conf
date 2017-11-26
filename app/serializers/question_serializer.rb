class QuestionSerializer < ActiveModel::Serializer
  attributes \
    :id,
    :body,
    :submitted_by,
    :yes_vote_total

  def submitted_by
    object.user.email
  end
end
