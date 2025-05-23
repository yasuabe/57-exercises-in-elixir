defmodule Ex15.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  def assert_validation(input, expect) do
    assert capture_io(input, fn -> Ex15.Main.run() end) =~ expect
  end

  test "validate password" do
    assert_validation "abc$123",  "Welcome"
    assert_validation "Abc$123",  "I don't know you"
    assert_validation "ab$123",   "I don't know you"
    assert_validation "abc$23",   "I don't know you"
    assert_validation "abc123",   "I don't know you"
    assert_validation "abc$1234", "I don't know you"
    assert_validation "abcd$123", "I don't know you"
  end
end
