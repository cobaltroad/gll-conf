class Questioning::AddQuestion
  include Interactor

  before do
    context.fail!(message: "Question body cannot be blank") if context.body.blank?
  end

  def call
    context.question = Question.create(user: context.user, body: context.body)
  end
end
