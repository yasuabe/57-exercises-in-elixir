defmodule Ex12.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "calculates simple interest for typical values" do
    inputs = """
      1500
      4.3
      4
      """
    output = capture_io(inputs, fn -> Ex12.Main.run() end)

    assert output =~ "4.3%"
    assert output =~ "4 years"
    assert output =~ "$1758"
  end

  test "rounds up to the nearest cent for fractional results" do
    inputs = """
      11
      1.1
      11
      """
    output = capture_io(inputs, fn -> Ex12.Main.run() end)

    assert output =~ "11 years"
    assert output =~ "1.1%"
    assert output =~ "$12.34"
  end
end
