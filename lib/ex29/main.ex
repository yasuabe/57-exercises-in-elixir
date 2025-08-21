## 29: Handling Bad Input
##
## - Prompt the user for the rate of return.
## - Keep prompting until a valid, non-zero numeric value is entered.
## - Use the formula years = 72 / r to calculate the years to double the investment.
## - Display the result after receiving valid input.
## - Use a loop to handle invalid input without exiting the program.

import Common.IoExt, only: [read_valid_natural_number: 2]

defmodule Ex29.Main do
  def run do
    rate =
      read_valid_natural_number(
        "What is the rate of return? ",
        "Sorry, that's not a valid input."
      )

    years = round(72 / rate)

    IO.puts("It will take #{years} years to double your initial investment.")
  end
end
