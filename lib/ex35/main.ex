# Ex35: Picking a Winner
#
# ・Prompt for names until a blank line is entered.
# ・Store non-blank names in a collection.
# ・Randomly select and print one name as the winner.
# ・Use a loop for input and a random number generator for selection.
# ・Exclude blank entries.
import Common.IoExt

defmodule Ex35.Main do
  defp read_names_loop(names) do
    name = read_trimmed("Enter a name: ")
    if name == "" do
      names
    else
      read_names_loop([name | names])
    end
  end

  def run do
    names = read_names_loop([])
    if Enum.empty?(names) do
      IO.puts("No names were entered.")
    else
      winner = Enum.random(names)
      IO.puts("The winner is #{winner}.")
    end
  end
end
