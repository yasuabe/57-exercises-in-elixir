# Ex1: Saying Hello
#
# ・Prompt the user to enter their name.
# ・Create a greeting message using string concatenation.
# ・Print the greeting.
# ・Keep input, concatenation, and output as separate steps.

defmodule Ex01.Main do
  def run do
    name = IO.gets("What is your name? ") |> String.trim()
    greeting = "Hello, " <> name <> ", nice to meet you!"
    IO.puts(greeting)
  end
end
