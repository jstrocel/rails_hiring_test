require "test_helper"

class RidingTest < ActiveSupport::TestCase

  def setup
    @riding = create(:riding)
    @poll = create(:poll, riding:@riding)
    @polling_location = create(:polling_location, riding:@riding)
  end

  test "should be valid" do
    assert @riding.valid?
  end

  test "has many polls" do
    assert_includes @riding.polls, @poll
  end

  test "has many polling locationss" do
    assert_includes @riding.polling_locations, @polling_location
  end

  test "associated polls should be destroyed" do
    assert_difference 'Poll.count', -1 do
      @riding.destroy
    end
  end

  test "associated polling locations should be destroyed" do
    assert_difference 'PollingLocation.count', -1 do
      @riding.destroy
    end
  end

  test "validates name" do
    @riding.name = nil
    assert_not @riding.valid?
  end

  test "validates riding code" do
    @riding.riding_code = nil
    assert_not @riding.valid?
  end

  test "validates province" do
    @riding.province = nil
    assert_not @riding.valid?
end

end
