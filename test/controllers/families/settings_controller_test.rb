require "test_helper"

class Families::SettingsControllerTest < ActionDispatch::IntegrationTest
  test "メールアドレスの更新に成功する" do
    family = Family.create!(email: "a@test.com", aikotoba: "aaa", password: "password123")
    post families_sessions_path, params: {family: { aikotoba: family.aikotoba, password: "password123" } }

    patch families_settings_path, params: {email: "b@test.com", aikotoba: family.aikotoba}
    family.reload
    assert_equal "b@test.com", family.email
  end

  test "あいことばの更新に成功する" do
    family = Family.create!(email: "a@test.com", aikotoba: "aaa", password: "password123")
    post families_sessions_path, params: {family: { aikotoba: family.aikotoba, password: "password123" } }

    patch families_settings_path, params: {email: family.email, aikotoba: "bbb"}
    family.reload
    assert_equal "bbb", family.aikotoba
  end
end
