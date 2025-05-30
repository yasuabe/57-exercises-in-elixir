# # Ex52: Creating Your Own Time Service
#
# - Build a minimal web server that returns the current time as JSON: { "currentTime": "2050-01-24 15:06:26" }.
# - Build a client that fetches this JSON, parses it, and displays the time in a readable format.
# - Server must set Content-Type: application/json.
# - Keep server code minimal.

defmodule Ex52.Server do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/ex52/time" do
    time = DateTime.utc_now() |> NaiveDateTime.to_string()
    json = ~s({"currentTime": "#{time}"})
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, json)
  end

  match _ do
    send_resp(conn, 404, "Not found")
  end
end
