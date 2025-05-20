# Ex2: Counting the Number of Characters
#
# ・Prompt the user to enter an input string.
# ・Determine the number of characters using a built-in function.
# ・Output the original string and its character count.
# ・Use a single output statement to construct the output.

defmodule Ex02.Main do
  def run do
    input  = IO.gets("What is the input string?") |> String.trim()
    count = String.length(input) |> Integer.to_string()

    IO.puts("#{input} has #{count} characters.")
  end
end
