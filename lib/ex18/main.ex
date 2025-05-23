# Ex18: Temperature Converter
#
# ・Prompt the user to choose conversion type: Fahrenheit ↔ Celsius.
# ・Accept both uppercase and lowercase (C, F).
# ・Prompt for the input temperature based on the choice.
# ・Convert using the appropriate formula.
# ・Display the result using minimal and non-redundant output statements.

import Common.IoExt

defmodule TemperatureConversion do
  @type t :: :CtoF | :FtoC

  def to(:CtoF), do: "Fahrenheit"
  def to(:FtoC), do: "Celsius"

  def fahrenheit_to_celsius(f) do
    (f - 32) * 5 / 9
  end

  def celsius_to_fahrenheit(c) do
    c * 9 / 5 + 32
  end

  def convert_temperature(choice, temp) do
    case choice do
      :FtoC -> fahrenheit_to_celsius(temp)
      :CtoF -> celsius_to_fahrenheit(temp)
    end
  end
end

defmodule Ex18.Main do
  alias TemperatureConversion, as: TC

  @conversion_selection_prompt """
  Press C to convert from Fahrenheit to Celsius.
  Press F to convert from Celsius to Fahrenheit.
  Your choice:
  """

  def read_conversion_choice do
    read_valid(
      @conversion_selection_prompt,
      "Invalid choice. Please enter 'C' or 'F'.",
      fn str ->
        case String.trim(str) |> String.downcase do
          "f" -> :CtoF
          "c" -> :FtoC
          _   -> :error
        end
      end
      )
  end

  def read_temperature(choice) do
    prompt = case choice do
      :CtoF -> "Please enter the temperature in Celsius: "
      :FtoC -> "Please enter the temperature in Fahrenheit: "
    end

    read_valid(
      prompt,
      "Invalid temperature.",
      fn str ->
        with {temp, ""} <- Float.parse(String.trim(str)) do
          temp
        else
          _ -> :error
        end
      end
    )
  end

  def run do
    conv_type = read_conversion_choice()
    temp_from = read_temperature(conv_type)

    temp_to   = TC.convert_temperature(conv_type, temp_from)

    IO.puts "The temperature in #{TC.to conv_type} is #{Float.round(temp_to, 2)}."
  end
end
