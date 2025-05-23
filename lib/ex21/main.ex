# Exercise 21: Numbers to Names
#
# ・Prompt the user to enter a number from 1 to 12.
# ・Display the corresponding month name (e.g., 1 → January).
# ・If the number is outside this range, show an error message.
# ・Use a switch or case statement.
# ・Use a single output statement.
import Common.IoExt

defmodule Ex21.Main do
  def read_month_number(prompt, error_msg) do
    read_valid(
      prompt,
      error_msg,
      &parse_int_with_condition(&1, fn x -> x >= 1 and x <= 12 end))
  end

  def run do
    number = read_month_number("Enter a number from 1 to 12: ", "Invalid month number")
    name = case number do
      1  -> "January"
      2  -> "February"
      3  -> "March"
      4  -> "April"
      5  -> "May"
      6  -> "June"
      7  -> "July"
      8  -> "August"
      9  -> "September"
      10 -> "October"
      11 -> "November"
      12 -> "December"
      _  -> raise "unreachable code"
    end
    IO.puts("The month is #{name}.")
  end
end
