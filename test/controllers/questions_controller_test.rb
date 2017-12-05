require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    user = users(:attendee)
    @header = auth_header(user.id)
  end

  test "current user posts a valid string" do
    post api_questions_url(body: "Some new question?"), headers: @header
    assert_response :created
  end

  test "current user posts an invalid string" do
    post api_questions_url(body: ""), headers: @header
    assert_response :unprocessable_entity
  end

  test "posting with no auth header" do
    post api_questions_url(body: "Doesn't matter?")
    assert_response :unauthorized
  end

  test "view all questions" do
    get api_questions_url, headers: @header
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
    get api_questions_url
    assert_response :unauthorized
  end

  test "selecting a question as moderator" do
    user = users(:moderator)
    header = auth_header(user.id)
    question = questions(:two)
    put api_question_url(id: question.id, is_selected: true), headers: header
    assert_response :ok
    assert question.reload.is_selected
  end

  test "selecting a question as attendee" do
    question = questions(:two)
    put api_question_url(id: question.id, is_selected: true), headers: @header
    assert_response :unauthorized
    assert_not question.is_selected
  end
end
