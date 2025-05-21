defmodule Common.Stdio do
  def read_valid(prompt, error_msg, converter) do
    case IO.gets(prompt) |> String.trim() |> converter.() do
      :error ->
        IO.puts(error_msg)
        read_valid(prompt, error_msg, converter)

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
    read_valid prompt, error_msg, parseInt
  end
end
