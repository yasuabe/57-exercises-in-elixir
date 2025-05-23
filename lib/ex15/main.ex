# Ex15: Password Validation
#
# ・Prompt the user for a password.
# ・Compare the input with a hardcoded known password.
# ・If it matches (case-sensitive), print “Welcome!”
# ・Otherwise, print “I don’t know you.”
# ・Use an if/else statement for the logic.-- Ex14: Tax Calculator

defmodule Ex15.Main do
  @correct_password "abc$123"

  def run do
    IO.gets("Enter your password: ")
    |> String.trim()
    |> (& &1 == @correct_password).()
    |> (&if &1 do "Welcome!" else "I don't know you." end).()
    |> IO.puts()
  end
end
