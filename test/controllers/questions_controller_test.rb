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
    hash_question_ids = hash.map { |q| q['id'] }

    expected_sort = [
      questions(:two).id,
      questions(:three).id,
      questions(:one).id
    ]
    assert_equal expected_sort, hash_question_ids
  end

  test "view all questions with no auth header" do
    get questions_url
    assert_response :unauthorized
  end
end
