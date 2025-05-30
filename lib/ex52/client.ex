# # Ex52: Creating Your Own Time Service
#
# - Build a minimal web server that returns the current time as JSON: { "currentTime": "2050-01-24 15:06:26" }.
# - Build a client that fetches this JSON, parses it, and displays the time in a readable format.
# - Server must set Content-Type: application/json.
# - Keep server code minimal.

defmodule Ex52.Client do
  @url "http://localhost:8080/ex52/time"

  def run do
    case Req.get(@url) do
      {:ok, %{body: %{"currentTime" => time_str}}} ->
        {:ok, naive} = NaiveDateTime.from_iso8601(time_str)
        formatted    = Calendar.strftime(naive, "%H:%M:%S UTC %B %-d %Y")
        IO.puts("The current time is #{formatted}.")

      {:error, reason} ->
        IO.puts("Request failed: #{inspect(reason)}")

      _ ->
        IO.puts("Unexpected response")
    end
  end
end
