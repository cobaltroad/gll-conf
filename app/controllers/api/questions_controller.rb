class Api::QuestionsController < Api::BaseController
  def index
    questions = Question.with_votes.order("yes_vote_total DESC")
    render json: questions,
           each_serializer: QuestionSerializer,
           current_user: @current_user
  end

  def create
    i = Questioning::AddQuestion.call(user: @current_user,
                                      body: params[:body])
    if i.success?
      render json: { question: i.question },
             status: :created
    else
      render json: i.message, status: :unprocessable_entity
    end
  end

  def update
    i = Questioning::SelectQuestion.call(user: @current_user,
                                         question_id: params[:id],
                                         is_selected: params[:is_selected])
    if i.success?
      render json: i.question,
             serializer: QuestionSerializer,
             current_user: @current_user
    else
      render json: i.message, status: i.status
    end
  end

  def vote
    i = Questioning::AddVote.call(user: @current_user,
                                  question_id: params[:id],
                                  yes_vote: params[:yes_vote])
    if i.success?
      render json: i.question,
             serializer: QuestionSerializer,
             current_user: @current_user,
             status: i.status
    else
      render json: i.message, status: :unprocessable_entity
    end
  end
end
