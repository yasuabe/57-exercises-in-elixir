defmodule Ex19.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  def test_bmi_calculation(height, weight, expected_bmi, expected_diagnosis) do
    output =
      capture_io(
        "#{height}\n#{weight}\n",
        fn -> Ex19.Main.run() end
      )

    assert output =~ "#{expected_bmi}."
    assert output =~ "#{expected_diagnosis}"
  end

  test "todo: rename" do
    test_bmi_calculation(66.5, 116.0, 18.4, "underweight")
    test_bmi_calculation(66.5, 116.1, 18.5, "ideal")
    test_bmi_calculation(66.5, 157.5, 25.0, "ideal")
    test_bmi_calculation(66.5, 157.6, 25.1, "overweight")
  end
end
