defmodule Ex04.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "3 pizzas split among 5 people: each gets 4 slices, 4 remain." do
    inputs = """
      dog
      walk
      blue
      quickly
      """
    output = capture_io(inputs, fn -> Ex04.Main.run() end)

    assert output =~ "Do you walk your blue dog quickly? That's hilarious!"
  end
end
