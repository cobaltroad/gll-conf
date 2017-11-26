require 'test_helper'

class AddVoteInteractorTest < ActiveSupport::TestCase
  def setup
    @user = users(:other_attendee)
    @question_one_id = questions(:one).id
    @question_two_id = questions(:two).id
    @question_three_id = questions(:three).id
  end

  test "user changes vote from no to yes" do
    assert_no_difference -> { Vote.count } do
      result = Questioning::AddVote.call(user: @user,
                                         question_id: @question_one_id,
                                         yes_vote: true)
      assert result.success?
      assert result.vote.yes_vote
    end
  end

  test "user changes vote from yes to no" do
    assert_no_difference -> { Vote.count } do
      result = Questioning::AddVote.call(user: @user,
                                         question_id: @question_two_id,
                                         yes_vote: false)
      assert result.success?
      assert_not result.vote.yes_vote
    end
  end

  test "user has not voted yet, votes yes" do
    assert_difference -> { Vote.count } do
      result = Questioning::AddVote.call(user: @user,
                                         question_id: @question_three_id,
                                         yes_vote: true)
      assert result.success?
      assert result.vote.yes_vote
    end
  end

  test "user has not voted yet, votes no" do
    assert_difference -> { Vote.count } do
      result = Questioning::AddVote.call(user: @user,
                                         question_id: @question_three_id,
                                         yes_vote: false)
      assert result.success?
      assert_not result.vote.yes_vote
    end
  end
end
