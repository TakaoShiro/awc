require "test_helper"

class Public::AnimalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_animals_index_url
    assert_response :success
  end

  test "should get show" do
    get public_animals_show_url
    assert_response :success
  end
end
