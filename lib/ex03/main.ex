# Ex3: Printing Quotes
# ・Prompt the user to enter a quote.
# ・Prompt the user to enter the author of the quote.
# ・Display the author and quote using escaped quotation marks.
# ・Use string concatenation, not interpolation or substitution.
# ・Use a single output statement for the result.

defmodule Ex03.Main do
  def run do
    quote  = IO.gets("What is the quote? ") |> String.trim()
    author = IO.gets("Who said it? ") |> String.trim()

    output = author <> " says, " <> "\"" <> quote <> "\""

    IO.puts(output)
  end
end
