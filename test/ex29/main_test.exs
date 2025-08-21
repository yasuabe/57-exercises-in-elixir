defmodule Ex29.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import Ex29.Main

  test "calculate years to double investment" do
    output =
      capture_io(
        """
        0
        ABC
        4
        """,
        fn -> run() end
      )
    assert output =~ "18 years"
    assert (String.replace(output, "\n", "")) =~ ~r/.*Sorry.*Sorry.*/
  end
end
