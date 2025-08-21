## Ex28: Adding Numbers
## ・ Prompt the user to enter five numbers.
## ・ Use a counted loop to handle repeated prompting.
## ・ Compute the total of the entered numbers.
## ・ Display the total at the end.

import Common.IoExt, only: [read_valid_non_nega_int: 2]

defmodule Ex28.Main do
  def run do
    total =
      fn -> read_valid_non_nega_int("Enter a number: ", "Please enter a non-negative integer.") end
      |> Stream.repeatedly()
      |> Enum.take(5)
      |> Enum.sum()

    IO.puts("The total is #{total}.")
  end
end
