defmodule Ex27.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import Ex27.Main

  test "read_all_input method should report all errors" do
    output =
      capture_io(
        """
        J

        ABCDE
        A12-1234
        """,
        fn -> run() end
      )
    assert output =~ "Enter the first name:"
    assert output =~ "Enter the last name:"
    assert output =~ "Enter the ZIP code:"
    assert output =~ "Enter the employee ID:"
    assert output =~ "The first name must be at least 2 characters long."
    assert output =~ "The last name cannot be empty."
    assert output =~ "The ZIP code must be numeric."
    assert output =~ "The employee ID must match the format AA-1234."
  end
  test "run method should display 'no errors found' if all inputs are valid" do
    output =
      capture_io(
        """
        Jimmy
        James
        55555
        TK-4321
        """,
        fn -> run() end
      )
    assert output =~ "no errors found"
  end
end
