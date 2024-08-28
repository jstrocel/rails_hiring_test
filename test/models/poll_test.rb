require "test_helper"

class PollTest < ActiveSupport::TestCase

  def setup
    @riding = create(:riding)
    @polling_location = create(:polling_location)
    @poll = create(:poll, riding:@riding, polling_location:@polling_location)
  end

  test "should be valid" do
    assert @poll.valid?
  end

  test "should require a number" do
    @poll.number = nil
    assert_not @poll.valid?
  end

  test "number should be unique within a riding" do
    poll_with_dup_number = build(:poll, number:@poll.number, riding:@riding)
    assert_not poll_with_dup_number.valid?
  end

  test "number outside riding does not need to be unique" do
    poll_with_dup_number = build(:poll, number:@poll.number)
    assert poll_with_dup_number.valid?    
  end

  test "belongs to riding" do
    assert_equal @poll.riding, @riding
  end

  test "belongs to polling location" do
    assert_equal @poll.polling_location, @polling_location
  end
  
  test "does not need a polling location" do
    @poll.polling_location = nil
    assert @poll.valid?
  end

  test "deletes polling location after all other polls are removed" do
    polling_location = create(:polling_location)
    polling_location_id = polling_location.id
    poll = create(:poll,polling_location:polling_location)

    poll.destroy!

    assert_not PollingLocation.exists?(polling_location_id)
  end
end
