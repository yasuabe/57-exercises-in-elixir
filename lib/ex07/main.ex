# Ex7: Area of a Rectangular Room
#
# ・Prompt the user to enter the length and width of a room in feet.
# ・Calculate the area in square feet.
# ・Convert the area to square meters using a constant conversion factor.
# ・Keep calculations separate from output.
# ・Display both square feet and square meters in the output.

import Common.IoExt

defmodule Ex07.Main do
  def run do
    length = read_valid_int("What is the length of the room in feet? ", "Invalid length")
    width  = read_valid_int("What is the width of the room in feet? ", "Invalid width")

    areaInFeet2  = length * width
    areaInMeter2 = areaInFeet2 * 0.09290304 * 1000 |> round() |> Kernel./(1000)

    IO.puts("You entered dimensions of #{length} feet by #{width} feet.")
    IO.puts("The area is")
    IO.puts("#{areaInFeet2} square feet")
    IO.puts("#{areaInMeter2} square meters")
  end
end
