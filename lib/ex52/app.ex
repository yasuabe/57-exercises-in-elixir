# # Ex52: Creating Your Own Time Service
#
# - Build a minimal web server that returns the current time as JSON: { "currentTime": "2050-01-24 15:06:26" }.
# - Build a client that fetches this JSON, parses it, and displays the time in a readable format.
# - Server must set Content-Type: application/json.
# - Keep server code minimal.

defmodule Ex52.App do
  def start do
    Plug.Cowboy.http(Ex52.Server, [], port: 8080)
  end
end
