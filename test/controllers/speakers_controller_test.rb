require "test_helper"

class SpeakersControllerTest < ActionDispatch::IntegrationTest
  test "正しいslugにアクセスすると録音ページが表示される" do
    family = Family.create!(email: "test@test.com", aikotoba: "aaa", password: "password123")
    speaker = Speaker.create!(family: family, name: "テスト太郎")

    get "/speakers/#{speaker.slug}"

    assert_response :success
  end
end
