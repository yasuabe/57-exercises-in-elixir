defmodule Common.IoExt do

  def read_trimmed(prompt) do
    IO.gets(prompt) |> String.trim()
  end

  def read_valid(prompt, error_msg, converter, condition \\ fn _ -> true end) do
    case read_trimmed(prompt) |> converter.() do
      :error ->
        IO.puts(error_msg)
        read_valid(prompt, error_msg, converter, condition)

      v -> if condition.(v), do: v, else: read_valid(prompt, error_msg, converter, condition)
    end
  end

  def parse_int_with_condition(str, condition \\ fn _ -> true end) do
    case Integer.parse(str) do
      {int, ""} ->
        if condition.(int), do: int, else: :error
      _ -> :error
    end
  end

  def read_valid_int(prompt, error_msg) do
    read_valid(prompt, error_msg, &parse_int_with_condition(&1))
  end

  def read_valid_non_nega_int(prompt, error_msg) do
    read_valid(prompt, error_msg, &parse_int_with_condition(&1, fn x -> x >= 0 end))
  end

  def read_money(prompt, error_msg) do
    read_valid(prompt, error_msg, fn str ->
      case Regex.run(~r/^(0|[1-9][0-9]*)(\.[0-9]{1,2})?$/, String.trim(str), capture: :first) do
        nil -> :error
        [s] -> (s |> Float.parse() |> elem(0))
      end
    end)
  end
end
