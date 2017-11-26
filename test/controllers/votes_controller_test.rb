require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  def setup
    user = users(:other_attendee)
    @header = auth_header(user.id)
  end

  test "current user votes on a new question" do
    question = questions(:three)
    post questions_url(question_id: question.id, yes_vote: false), headers: @header
    assert_response :created
  end

  test "current user changes vote on an existing question" do
    question = questions(:two)
    post questions_url(question_id: question.id, yes_vote: false), headers: @header
    assert_response :ok
  end

  test "current user posts the same vote to an existing question" do
    question = questions(:one)
    post questions_url(question_id: question.id, yes_vote: false), headers: @header
    assert_response :not_modified
  end

  test "posting with no auth header" do
    question = questions(:one)
    post questions_url(question_id: question.id, yes_vote: false)
    assert_response :unauthorized
  end
end
