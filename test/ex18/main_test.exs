defmodule Ex18.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "converts 32°F to 0℃" do
    output = capture_io(
      "C\n32\n",
      fn ->
        Ex18.Main.run()
      end)
    assert output =~ "Please enter the temperature in Fahrenheit:"
    assert output =~ "The temperature in Celsius is 0."
  end
  test "converts 0℃ to 32°F" do
    output = capture_io(
      "F\n0\n",
      fn ->
        Ex18.Main.run()
      end)
    assert output =~ "Please enter the temperature in Celsius:"
    assert output =~ "The temperature in Fahrenheit is 32.0."
  end
end
