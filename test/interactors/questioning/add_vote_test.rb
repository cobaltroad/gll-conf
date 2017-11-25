require 'test_helper'

class AddVoteInteractorTest < ActiveSupport::TestCase
  def setup
    @user = users(:other_attendee)
    @question_one = questions(:one)
    @question_two = questions(:two)
    @question_three = questions(:three)
  end

  test "user changes vote from no to yes" do
    assert_no_difference -> { Vote.count } do
      result = Questioning::AddVote.call(user: @user, question: @question_one, yes_vote: true)
      assert result.success?
      assert result.vote.yes_vote
    end
  end

  test "user changes vote from yes to no" do
    assert_no_difference -> { Vote.count } do
      result = Questioning::AddVote.call(user: @user, question: @question_two, yes_vote: false)
      assert result.success?
      assert_not result.vote.yes_vote
    end
  end

  test "user has not voted yet, votes yes" do
    assert_difference -> { Vote.count } do
      result = Questioning::AddVote.call(user: @user, question: @question_three, yes_vote: true)
      assert result.success?
      assert result.vote.yes_vote
    end
  end

  test "user has not voted yet, votes no" do
    assert_difference -> { Vote.count } do
      result = Questioning::AddVote.call(user: @user, question: @question_three, yes_vote: false)
      assert result.success?
      assert_not result.vote.yes_vote
    end
  end
end
