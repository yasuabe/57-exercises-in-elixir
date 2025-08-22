# # Ex36: Computing Statistics
#
# - Prompt the user to enter numbers representing response times until “done” is entered.
# - Store the numeric inputs in an array, excluding “done”.
# - Compute and display the average, minimum, maximum, and standard deviation.
# - Use loops and arrays for input and calculations.
# - Keep input, processing, and output logic separate.
import Common.IoExt

defmodule Ex36.Main do
  def try_convert("done"), do: nil

  def try_convert(value) do
    case Integer.parse(value) do
      {number, ""} when number >= 0 -> number
      _ -> :error
    end
  end

  def try_get_number do
    read_valid(
      "Enter a number: ",
      "Please enter a non-negative integer.",
      &try_convert/1
    )
  end

  def get_numbers(), do: get_numbers([]) |> Enum.reverse()

  def get_numbers(acc) do
    case try_get_number() do
      nil -> acc
      number -> get_numbers([number | acc])
    end
  end

  def compute_statistics(numbers) do
    count = length(numbers)
    sum = Enum.sum(numbers)
    ave = sum / count

    min = Enum.min(numbers)
    max = Enum.max(numbers)

    variance = Enum.reduce(numbers, 0, fn x, acc -> acc + :math.pow(x - ave, 2) end) / count
    stddev = :math.sqrt(variance)

    {round(ave), min, max, Float.round(stddev, 2)}
  end

  def report(numbers, {ave, min, max, stddev}) do
    str_numbers = Enum.join(numbers, ", ")

    IO.puts("Numbers: #{str_numbers}")
    IO.puts("The average is #{ave}.")
    IO.puts("The minimum is #{min}.")
    IO.puts("The maximum is #{max}.")
    IO.puts("The standard deviation is #{stddev}.")
  end

  def run do
    numbers = get_numbers()

    if length(numbers) > 0 do
      stats = compute_statistics(numbers)
      report(numbers, stats)
    else
      IO.puts("No valid numbers were entered.")
    end
  end
end
