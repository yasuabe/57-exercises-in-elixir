defmodule Ex44.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "scenario in the book" do
    # ARRANGE
    input = "iPad\nWidget\n"

    # ACT
    output = capture_io([input: input], fn -> Ex44.Main.run() end)

    # ASSERT
    assert output =~ "not found in our inventory"
    assert output =~ "Name: Widget"
    assert output =~ "Price: $25.00"
    assert output =~ "Quantity on Hand: 5"
  end
end
