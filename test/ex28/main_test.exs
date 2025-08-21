defmodule Ex28.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import Ex28.Main

  test "run method should display the total of entered numbers" do
    output =
      capture_io(
        """
        1
        2
        3
        Three
        4
        5
        """,
        fn -> run() end
      )
    assert output =~ "Please enter a non-negative integer."
    assert output =~ "The total is 15."
  end
end
