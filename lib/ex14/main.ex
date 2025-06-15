# Ex14: Tax Calculator
#
# ・ Prompt the user for the order amount and the state.
# ・ If the state is "WI", calculate 5.5% tax and display subtotal, tax, and total.
# ・ For other states, display only the total.
# ・ Use only a simple if statement (no else clause).
# ・ Round all money up to the nearest cent.
# ・ Use a single output statement at the end.

import Common.IoExt, only: [read_trimmed: 1, read_money: 2]

defmodule Ex14.Main do
  def read_price_cent() do
    read_money("What is the order amount? ", "Invalid amount.")
  end

  def run do
    subtotal = read_price_cent() * 100
    state = read_trimmed("What is the state? ")

    tax = ceil(subtotal * 0.055)
    total = subtotal + tax

    to_dollar = &:io_lib.format("~.2f", [&1 / 100])

    IO.puts(
      if state == "WI" do
        """
        The subtotal is $#{to_dollar.(subtotal)}.
        The tax is $#{to_dollar.(tax)}.
        The total is $#{to_dollar.(total)}.
        """
      else
        """
        The total is $#{to_dollar.(subtotal)}.
        """
      end
    )
  end
end
