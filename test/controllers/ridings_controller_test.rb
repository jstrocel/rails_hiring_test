require "test_helper"

class RidingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @riding = create(:riding)
  end

  test "should get index" do
    get ridings_url
    assert_response :success
  end

  test "should get new" do
    get new_riding_url
    assert_response :success
  end

  test "should create riding" do
    assert_difference("Riding.count") do
      post ridings_url, params: { riding: { name: @riding.name, province: @riding.province, riding_code: @riding.riding_code } }
    end

    assert_redirected_to riding_url(Riding.last)
  end

  test "should show riding" do
    get riding_url(@riding)
    assert_response :success
  end

  test "should get edit" do
    get edit_riding_url(@riding)
    assert_response :success
  end

  test "should update riding" do
    patch riding_url(@riding), params: { riding: { name: @riding.name, province: @riding.province, riding_code: @riding.riding_code } }
    assert_redirected_to riding_url(@riding)
  end

  test "should destroy riding" do
    assert_difference("Riding.count", -1) do
      delete riding_url(@riding)
    end

    assert_redirected_to ridings_url
  end
end
