defmodule Ex14.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "If the state is “WI,” then the order must be charged 5.5% tax." do
    inputs = """
      10
      WI
      """
    output = capture_io(inputs, fn -> Ex14.Main.run() end)

    assert output =~ "The subtotal is $10.00."
    assert output =~ "The tax is $0.55."
    assert output =~ "The total is $10.55."
  end
  test "If the state is not “WI,” then any tax will not be charged." do
    inputs = """
      10
      NM
      """
    output = capture_io(inputs, fn -> Ex14.Main.run() end)

    assert output =~ "The total is $10.00."
    assert !(output =~ "tax")
    assert !(output =~ "subtotal")
  end
end
