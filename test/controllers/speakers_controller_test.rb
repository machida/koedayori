require "test_helper"

class SpeakersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get speakers_show_url
    assert_response :success
  end
end
