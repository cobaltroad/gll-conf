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

  test "view all questions" do
    get questions_url, headers: @header
    assert_response :ok
    json = response.body
    hash = json.blank? ? {} : JSON.parse(json)
    hash_question_ids = hash['questions'].map { |q| q['id'] }
    assert_equal hash_question_ids, Question.all.map(&:id)
  end

  test "view all questions with no auth header" do
    get questions_url
    assert_response :unauthorized
  end
end
