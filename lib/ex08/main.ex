# Ex8: Pizza PeopleAndPizza
#
# ・ Prompt the user for the number of people, pizzas, and slices per pizza.
# ・ Calculate the total number of slices.
# ・ Determine how many slices each person gets evenly.
# ・ Calculate and display any leftover slices.
# ・ Output the distribution results clearly.

import Common.IoExt
import Common.MathExt

defmodule Ex08.Main do
  @slices_per_pizza 8

  def run do
    people = read_valid_non_nega_int("How many people? "            , "Invalid people")
    pizzas = read_valid_non_nega_int("How many pizzas do you have? ", "Invalid pizzas")

    {slices, leftover} = div_mod((pizzas * @slices_per_pizza), people)

    IO.puts("#{people} people with #{pizzas} pizzas.")
    IO.puts("Each person gets #{slices} slices of pizza.")
    IO.puts("There are #{leftover} slices left over.")
  end
end
