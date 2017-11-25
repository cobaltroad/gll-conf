class Questioning::AddVote
  include Interactor

  before do
    @question = Question.find(context.question_id)
    context.fail!(message: "Question required") unless @question
  end

  def call
    existing_vote = Vote.find_by(user: context.user, question: @question)
    if existing_vote
      existing_vote.update_attributes(yes_vote: context.yes_vote)
      context.vote = existing_vote
    else
      context.vote = Vote.create(user: context.user, question: @question, yes_vote: context.yes_vote)
    end
  end
end
