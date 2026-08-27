require "test_helper"

class ThemeTest < ActiveSupport::TestCase
  test "ある日(yday)が偶数の日は1つ目のテーマを返す" do
    travel_to Date.new(2026, 1, 2) do
      assert_equal themes(:one), Theme.choose
    end
  end

  test "ある日(yday)が奇数の日は2つ目のテーマを返す" do
    travel_to Date.new(2026, 1, 3) do
      assert_equal themes(:two), Theme.choose
    end
  end
end
