defmodule Common.IoExtTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import Common.IoExt

  test "read_money/4 with valid input" do
    validate = fn input, expected ->
      capture_io("#{input}\n", fn ->
        assert read_money("Enter a number: ", "Invalid input.") == expected
      end)
    end

    validate.("0", 0)
    validate.("0.0", 0)
    validate.("0.00", 0)
    validate.("1", 1)
    validate.("0.1", 0.1)
    validate.("0.01", 0.01)
  end

  test "read_money/4 with invalid input2" do
    validate = fn input ->
      assert capture_io("#{input}\n 0", fn ->
               assert read_money("Enter a number: ", "Invalid input.") == 0
             end) =~ "Invalid input."
    end

    validate.("1.111")
    validate.(".11")
    validate.("1.")
  end
end
