require 'test_helper'

class AddQuestionInteractorTest < ActiveSupport::TestCase
  def setup
    @user = users(:attendee)
  end

  test "user adds a question" do
    assert_difference ->{ Question.count } do
      result = Questioning::AddQuestion.call(user: @user, body: "New Question?")
      assert result.success?
    end
  end

  test "question is a blank string" do
    assert_no_difference ->{ Question.count } do
      result = Questioning::AddQuestion.call(user: @user, body: "")
      assert_not result.success?
    end
  end

  test "question is nil" do
    assert_no_difference ->{ Question.count } do
      result = Questioning::AddQuestion.call(user: @user, body: nil)
      assert_not result.success?
    end
  end
end
