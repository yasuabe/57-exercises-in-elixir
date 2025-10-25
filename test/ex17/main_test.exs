defmodule Ex17.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  def assert_validation(input, expect) do
    assert capture_io(input, fn -> Ex17.Main.run() end) =~ expect
  end

  test "validate BAC calculation" do
    assert_validation(
      """
      150
      F
      2
      1
      """,
      """
      Your BAC is: 0.089
      It is not legal to drive.
      """
    )

    assert_validation(
      """
      180
      M
      2
      2
      """,
      """
      Your BAC is: 0.048
      It is legal to drive.
      """
    )
  end
end
