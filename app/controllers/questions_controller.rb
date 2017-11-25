class QuestionsController < BaseController
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
