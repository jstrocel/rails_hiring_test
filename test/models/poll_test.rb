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
end
