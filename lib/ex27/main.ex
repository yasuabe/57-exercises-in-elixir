## Ex27: Validating Inputs
##
## - Prompt the user for first name, last name, ZIP code, and employee ID.
## - Validate each input:
##   - First and last names must not be empty and must be at least two characters long.
##   - ZIP code must be numeric.
##   - Employee ID must match the format AA-1234.
##
## - Create a separate function for each validation.
## - Create a validateInput function to coordinate all validations.
## - Use a single output statement to display all error messages or success.

import Common.IoExt
import String, only: [replace: 3, to_atom: 1, downcase: 1]

defmodule Ex27.Main do
  def should_be_non_empty(field_name, name) do
    case String.trim(name) do
        "" -> {:error, "The #{field_name} cannot be empty."}
        _  -> {:ok   , name}
      end
  end

  def should_be_long_enough(field_name, name) do
    case String.length(name) do
      len when len < 2 -> {:error, "The #{field_name} must be at least 2 characters long."}
      _                -> {:ok   , name}
    end
  end

  def should_be_numeric(field_name, input) do
    case Integer.parse(input) do
      {num, ""} -> {:ok   , num}
      _         -> {:error, "The #{field_name} must be numeric."}
    end
  end

  def should_match_regex(regex, pattern, field_name, input) do
    case Regex.match?(regex, input) do
      true  -> {:ok   , input}
      false -> {:error, "The #{field_name} must match the format #{pattern}."}
    end
  end

  def valid_name(field_name, name) do
    with {:ok, non_empty} <- should_be_non_empty(field_name, name) do
      should_be_long_enough(field_name, non_empty)
    end
  end

  def valid_zip_code(field_name, value),
    do: should_be_numeric(field_name, value)

  def valid_employee_id(field_name, value),
    do: should_match_regex(~r/^[A-Z]{2}-\d{4}$/, "AA-1234", field_name, value)

  def validate_input(inputs) do
    [
      valid_name(       "first name" , inputs.first_name),
      valid_name(       "last name"  , inputs.last_name),
      valid_zip_code(   "ZIP code"   , inputs.zip_code),
      valid_employee_id("employee ID", inputs.employee_id)
    ]
    |> Enum.flat_map(fn
      {:ok, _}      -> []
      {:error, msg} -> [msg]
    end)
    |> case do
      []     -> "There were no errors found."
      errors -> Enum.join(errors, "\n")
    end

  end

  def run do
    toKey = fn field -> replace(field, " ", "_") |> downcase() |> to_atom() end

    ["first name", "last name", "ZIP code", "employee ID"]
    |> Enum.map(&{&1, read_trimmed("Enter the #{&1}: ")})
    |> Map.new(fn {field, value} -> {toKey.(field), value} end)
    |> validate_input()
    |> IO.puts
  end
end
