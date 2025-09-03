# Ex19: BMI Calculator
#
# - Prompt the user for their height (in inches) and weight (in pounds).
# - Calculate BMI using:
# - ` bmi = (weight / (height × height)) × 703 ``
# - Display:
#   - “You are within the ideal weight range.” if BMI is 18.5–25.
#   - Otherwise, indicate if the user is underweight or overweight and advise seeing a doctor.
# - Input must be numeric—reject non-numeric input.

import Common.IoExt

defmodule Ex19.Main do
  @bmi_factor 703

  def read_measurement(measurement, unit) do
    read_valid(
      "Enter your #{measurement} in #{unit}: ",
      "Invalid #{measurement}.",
      fn str ->
        case Regex.run(~r/^(0|[1-9][0-9]*)(\.[0-9]{1,1})?$/, String.trim(str), capture: :first) do
          nil -> :error
          [s] -> s |> Float.parse() |> elem(0)
        end
      end
    )
  end

  def diagnose(bmi) do
    cond do
      bmi < 18.5 -> "You are underweight. You should see your doctor."
      bmi > 25.0 -> "You are overweight. You should see your doctor."
      true       -> "You are within the ideal weight range."
    end
  end

  def run do
    height = read_measurement("height", "inches")
    weight = read_measurement("weight", "pounds")

    bmi = Float.round(weight / :math.pow(height, 2) * @bmi_factor, 1)

    IO.puts("Your BMI is #{Float.round(bmi, 1)}.")
    IO.puts(diagnose(bmi))
  end
end
