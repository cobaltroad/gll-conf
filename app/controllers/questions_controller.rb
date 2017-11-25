class QuestionsController < BaseController
  def index
    questions = Question.with_votes.order("yes_vote_total DESC")
    render json: questions, each_serializer: QuestionSerializer
  end

  def create
    i = Questioning::AddQuestion.call(user: @current_user,
                                      body: params[:question])
    if i.success?
      render json: { question: i.question }, status: :created
    else
      render json: i.errors, status: :unprocessable_entity
    end
  end
end
