defmodule Ex08.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "3 pizzas split among 5 people: each gets 4 slices, 4 remain." do
    output = capture_io(
      "5\n3\n",
      fn -> Ex08.Main.run() end)

    assert output =~ "5 people with 3 pizzas"
    assert output =~ "Each person gets 4 slices of pizza"
    assert output =~ "There are 4 slices left over"
  end
end
