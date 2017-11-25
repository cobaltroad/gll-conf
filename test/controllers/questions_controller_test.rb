require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "current user posts a valid string" do
    login_as_attendee
    post questions_url(question: "Some new question?")
    assert_response :created
  end

  test "current user posts an invalid string" do
    login_as_attendee
    post questions_url(question: "")
    assert_response :unprocessable_entity
  end

  test "posting without logging in" do
    post questions_url(question: "Doesn't matter?")
    assert_response :unauthorized
  end
end
