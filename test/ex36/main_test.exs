defmodule Ex36.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import Ex36.Main

  test "calculates statistics from given response times" do
    output =
      capture_io(
        """
        100
        200
        1000
        300
        done
        """,
        fn -> run() end
      )

    assert output =~ "Numbers: 100, 200, 1000, 300"
    assert output =~ "The average is 400."
    assert output =~ "The minimum is 100."
    assert output =~ "The maximum is 1000."
    assert output =~ "The standard deviation is 353.55."
  end

  test "handles invalid inputs properly" do
    output =
      capture_io(
        """
        invalid
        1
        2.5
        2
        done
        """,
        fn -> run() end
      )

    assert output =~ "Numbers: 1, 2"
    lines = String.split(output, "\n")
    error_count = Enum.count(lines, fn line -> String.contains?(line, "non-negative") end)
    assert error_count == 2
  end

  test "reports properly when no valid inputs are given" do
    output =
      capture_io(
        """
        node
        done
        """,
        fn -> run() end
      )

    error_count =
      Enum.count(
        String.split(output, "\n"),
        fn line -> String.contains?(line, "non-negative") end
      )

    assert error_count == 1
    assert output =~ "No valid numbers were entered"
  end
end
