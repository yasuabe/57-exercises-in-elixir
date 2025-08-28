# Ex12: Computing Simple Interest
#
# - Prompt for principal, interest rate (as %), and years.
# - Compute simple interest: A = P × (1 + r × t).
# - Convert percent rate by dividing by 100.
# - Round up to the nearest cent.
# - Format the output as currency.

import Common.IoExt, only: [read_money: 2, read_valid_int: 2, read_valid_float: 2]

defmodule Ex12.Main do
  def run do
    principal = read_money(      "Enter the principal: "       , "Invalid principal.")
    rate      = read_valid_float("Enter the rate of interest: ", "Invalid rate.")
    years     = read_valid_int(  "Enter the number of years: " , "Invalid years.")

    amount =
      principal * (1 + rate / 100 * years)
      |> Float.ceil(2)

    :io.format(
      "After ~w years at ~w%, the investment will be worth $~.2f.~n",
      [years, rate, amount]
    )
  end
end
