class Questioning::AddVote
  include Interactor

  before do
    @question = Question.with_votes.find_by(id: context.question_id)
    context.fail!(message: "Question required") unless @question
  end

  def call
    existing_vote = Vote.find_by(user: context.user, question: @question)
    if existing_vote
      existing_vote.update_attributes(yes_vote: context.yes_vote)
      context.vote = existing_vote
      changed = existing_vote.yes_vote_previously_changed?
      context.status = changed ? :ok : :not_modified
    else
      context.vote = Vote.create(user: context.user, question: @question, yes_vote: context.yes_vote)
      context.status = :created
    end
    context.question = Question.with_votes.find_by(id: @question.id)
  end
end
