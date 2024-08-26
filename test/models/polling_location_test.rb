require "test_helper"

class PollingLocationTest < ActiveSupport::TestCase

  def setup
    @riding = create(:riding)
    @polling_location = create(:polling_location, riding:@riding)
    @poll = create(:poll, polling_location:@polling_location)
  end

  test "should be valid" do
    puts @polling_location.errors.full_messages
    assert @polling_location.valid?
  end

  test "belongs to riding" do
    assert_equal @polling_location.riding, @riding
  end

  test "has many polls" do
    assert_includes @polling_location.polls, @poll
  end

  test "validates title" do
    @polling_location.title = nil
    assert_not @polling_location.valid?
  end

  test "validates address" do
    @polling_location.address = nil
    assert_not @polling_location.valid?
  end

  test "validates city" do
    @polling_location.city = nil
    assert_not @polling_location.valid?
  end

  test "validates postal code presence" do
    @polling_location.postal_code = nil
    assert_not @polling_location.valid?
  end

  test "validates postal code format" do
    @polling_location.postal_code = "90210"
    assert_not @polling_location.valid?
  end

  test "formats postal code" do
    polling_location = build(:polling_location, postal_code:"k1p0a9")
    polling_location.save
    assert_equal polling_location.postal_code, "K1P 0A9"
  end

end
