defmodule Ex10.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "make_receipt returns correct values" do
    items = [{2522, 2}, {1022, 1}, {422, 1}]
    {subtotal, tax, total} = Ex10.Main.make_receipt(items)

    #             | actual  | expected | delta
    assert_in_delta subtotal, 6488     , 0.001
    assert_in_delta tax     , 357      , 0.001
    assert_in_delta total   , 6845     , 0.001
  end

  test "print_receipt outputs formatted receipt" do
    receipt = {1700, 93, 1793}
    output = capture_io(fn -> Ex10.Main.print_receipt(receipt) end)
    assert output =~ "Subtotal: $17.00"
    assert output =~ "Tax: $0.93"
    assert output =~ "Total: $17.93"
  end
end
