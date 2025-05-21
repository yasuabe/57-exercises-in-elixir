defmodule Common.Stdio do
  def read_valid(prompt, converter, error_msg) do
    case IO.gets(prompt) |> String.trim() |> converter.() do
      :error ->
        IO.puts(error_msg)
        read_valid(prompt, converter, error_msg)

      v -> v
    end
  end

  def read_int(prompt, error_msg) do
    parseInt = fn
      str ->
        case Integer.parse(str) do
          {int, ""} -> int
          _         -> :error
        end
    end
    read_valid prompt, parseInt, error_msg
  end
end
