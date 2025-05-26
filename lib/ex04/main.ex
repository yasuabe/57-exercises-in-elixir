# Ex4: Mad Lib
# ・ Prompt the user to enter a noun, a verb, an adjective, and an adverb.
# ・ Create a story using the inputs.
# ・ Use string interpolation or substitution to build the output.
# ・ Use a single output statement to display the story.

import Common.IoExt, only: [read_trimmed: 1]

defmodule Ex04.Main do
  def run do
    n   = read_trimmed("Enter a noun: ")
    v   = read_trimmed("Enter a verb: ")
    adj = read_trimmed("Enter an adjective: ")
    adv = read_trimmed("Enter an adverb: ")

    IO.puts("Do you #{v} your #{adj} #{n} #{adv}? That's hilarious!")
  end
end
