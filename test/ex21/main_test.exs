defmodule Ex21.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "display error messages for invalid inputs" do
    output = capture_io(
      "0\n13\n   5 ",
      fn ->
        Ex21.Main.run()
      end)
    assert output =~ ~r/Invalid.*Invalid/s
    assert output =~ "May"
  end
end
