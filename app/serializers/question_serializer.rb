class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :body, :yes_vote_total
  attribute :submitted_by

  def submitted_by
    object.user.email
  end
end
