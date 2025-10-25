# # Ex17: Blood Alcohol Calculator
# - Prompt for weight, gender, alcohol amount, and time since last drink.
# - Compute BAC using a given formula.
# - Report whether it's legal to drive (BAC ≥ 0.08 means illegal).
# - Constraint: Validate that inputs are numeric.

defmodule Ex17.Main do
  import Common.IoExt

  defp read_weight do
    read_valid_float_with_condition(
      "Enter your weight (pounds): ",
      "Invalid weight",
      fn x -> x > 0 end
    )
  end

  defp read_gender_factor do
    read_valid(
      "Enter your gender (M for male, F for female): ",
      "Invalid gender",
      fn str ->
        case String.trim(str) |> String.upcase() do
          "M" -> 0.73
          "F" -> 0.66
          _ -> :error
        end
      end
    )
  end

  defp read_alcohol_amount do
    read_valid_float_with_condition(
      "Enter the amount of alcohol consumed (oz): ",
      "Invalid alcohol amount",
      fn x -> x >= 0 end
    )
  end

  defp read_hours do
    read_valid_float_with_condition(
      "Enter the time since last drink (hours): ",
      "Invalid time.",
      fn x -> x >= 0 end
    )
  end

  defp calculate_bac(weight, gender_factor, alcohol_amount, hours) do
    (alcohol_amount * 5.14 / (weight * gender_factor) - 0.015 * hours)
    |> Float.round(3)
  end

  def run do
    weight = read_weight()
    factor = read_gender_factor()
    amount = read_alcohol_amount()
    hours = read_hours()

    bac = calculate_bac(weight, factor, amount, hours)
    IO.puts("Your BAC is: #{bac}")

    if bac >= 0.08 do
      IO.puts("It is not legal to drive.")
    else
      IO.puts("It is legal to drive.")
    end
  end
end
