defmodule Ex14.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "charges 5.5% tax for WI state" do
    inputs = """
      10
      WI
      """
    output = capture_io(inputs, fn -> Ex14.Main.run() end)

    assert output =~ "The subtotal is $10.00."
    assert output =~ "The tax is $0.55."
    assert output =~ "The total is $10.55."
  end

  test "charges no tax for non-WI states" do
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
