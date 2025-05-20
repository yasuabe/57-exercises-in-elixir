defmodule Common.Stdio do
  def read_valid(prompt, converter, error_msg) do
    case IO.gets(prompt) |> String.trim() |> converter.() do
      :error ->
        IO.puts(error_msg)
        read_valid(prompt, converter, error_msg)

      v -> v
    end
  end

  def read_input(prompt) do
    parseInt = fn
      str ->
        case Integer.parse(str) do
          {int, ""} -> int
          _         -> :error
        end
    end
    error_msg = "Invalid input. Please enter a number."
    read_valid prompt, parseInt, error_msg
  end
end
