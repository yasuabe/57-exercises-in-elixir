# Ex5: Simple Math
#
# ・Prompt the user to enter two numbers.
# ・Convert the input strings to numeric types before performing calculations.
# ・Calculate the sum, difference, product, and quotient.
# ・Keep input and output separate from processing logic.
# ・Use a single output statement with line breaks to display the results.
import Common.IoExt, only: [read_valid_float: 2]

defmodule Ex05.Main do
  def read_number(prompt) do
    read_valid_float(prompt,"enter a valid number")
  end
  def divide(n1, n2) do
    if n2 == 0 do "NaN" else n1 / n2 end
  end
  def run do
    n1 = read_number("What is the first number? ")
    n2 = read_number("What is the second number? ")

    output = """
      #{n1} + #{n2} = #{n1 + n2}
      #{n1} - #{n2} = #{n1 - n2}
      #{n1} * #{n2} = #{n1 * n2}
      #{n1} / #{n2} = #{divide(n1, n2)}
      """
    IO.puts(output)
  end
end
