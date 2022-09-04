require "test_helper"

class Public::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_registrations_index_url
    assert_response :success
  end

  test "should get show" do
    get public_registrations_show_url
    assert_response :success
  end
end
