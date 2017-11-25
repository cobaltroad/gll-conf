class Questioning::AddQuestion
  include Interactor

  before do
    context.fail!(message: "Question body cannot be blank") if context.question.blank?
  end

  def call
    Question.create(user: context.user, body: context.question)
  end
end
