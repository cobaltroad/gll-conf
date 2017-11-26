class Questioning::SelectQuestion
  include Interactor

  before do
    context.fail!(message: "Must be moderator", status: :unauthorized) unless context.user.is_moderator?
    @question = Question.with_votes.find_by(id: context.question_id)
    context.fail!(message: "Question required", status: :unprocessable_entity) unless @question
  end

  def call
    @question.update_attributes(is_selected: context.is_selected)
    context.question = @question
  end
end
