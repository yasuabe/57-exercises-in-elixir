defmodule Ex22.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "select max number correctly" do
    output =
      capture_io(
        """
        -1
        bad input
        13
          +5
        """,
        fn -> Ex22.Main.run() end
      )

    assert output =~ "Invalid"
    assert output =~ "13"
  end

  test "end program if numbers are the same" do
    output =
      capture_io(
        """
        13
        -1
        13
        """,
        fn -> Ex22.Main.run() end
      )

    assert output =~ "same numbers found"
  end
end
