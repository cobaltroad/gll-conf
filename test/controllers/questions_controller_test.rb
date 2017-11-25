require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    user = users(:attendee)
    @header = auth_header(user.id)
  end

  test "current user posts a valid string" do
    post questions_url(question: "Some new question?"), headers: @header
    assert_response :created
  end

  test "current user posts an invalid string" do
    post questions_url(question: ""), headers: @header
    assert_response :unprocessable_entity
  end

  test "posting with no auth header" do
    post questions_url(question: "Doesn't matter?")
    assert_response :unauthorized
  end
end
