##  Ex22: Comparing Numbers
##
## - Prompt the user to enter three numbers.
## - If any numbers are the same, exit the program.
## - Otherwise, determine and display the largest number.
## - Do not use built-in functions to find the largest value.

import Common.IoExt

defmodule Ex22.Main do
  def max_excluding_duplicates(a, b, c) do
    cond do
      a == b or b == c or a == c ->
        {:ng, "same numbers found, exiting program."}
      a > b and a > c -> {:ok, a}
      b > c           -> {:ok, b}
      true            -> {:ok, c}
    end
  end

  def run do
    read =
      &read_valid_int(
        "Enter the #{&1} number: ",
        "Invalid input. Please enter an integer."
      )

    [n1, n2, n3] =
      ["first", "second", "third"]
      |> Enum.map(read)

    case max_excluding_duplicates(n1, n2, n3) do
      {:ok, largest} -> IO.puts("The largest number is #{largest}.")
      {:ng, msg}     -> IO.puts(msg)
    end
  end
end
