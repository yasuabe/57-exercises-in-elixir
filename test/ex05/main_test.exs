defmodule Ex05.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "calculates and displays sum, difference, product, and quotient of two numbers" do
    inputs = """
      10
      5
      """
    output = capture_io(inputs, fn -> Ex05.Main.run() end)

    assert output =~ "10.0 + 5.0 = 15.0"
    assert output =~ "10.0 - 5.0 = 5.0"
    assert output =~ "10.0 * 5.0 = 50.0"
    assert output =~ "10.0 / 5.0 = 2.0"
  end
end
