# Ex49: Flickr Photo Search
#
# ・ Take in a search string via GUI.
# ・ Fetch Flickr’s public photo feed matching the search.
# ・ Display resulting photos visually.# Ex47: Who’s in Space?

defmodule Ex49.Main do
  @api_url "https://www.flickr.com/services/feeds/photos_public.gne?format=json&tags="

  def start do
    port = Port.open({:spawn, "npx electron lib/ex49/assets/electron_app.js"}, [:binary])
    fetch_urls() |> send_to_electron(port, "search")
    loop(port)
  end

  defp send_to_electron(data, port, res_type) do
    {:ok, message} = Jason.encode(%{"res" => res_type, "payload" => data})
    Port.command(port, message <> "\n")
  end

  defp loop(port) do
    receive do
      {^port, {:data, data}} ->
        case Jason.decode(data) do
          {:ok, %{"cmd" => "exit"}} ->
            IO.puts("Exiting application...")
            System.halt(0)
          {:ok, %{"cmd" => "search"} = decoded} ->
            decoded
            |> Map.get("tags", "")
            |> fetch_urls()
            |> send_to_electron(port, "search")
            loop(port)
          {:error, _reason} ->
            IO.puts("Invalid data received: #{data}")
            loop(port)
        end
    end
  end

  defp fetch_urls(tags \\ "") do
    @api_url <> tags
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> String.replace(~r/^jsonFlickrFeed\(/, "")
    |> String.replace(~r/\)$/, "")
    |> Jason.decode!()
    |> Map.get("items", [])
    |> Enum.map(fn item -> Map.get(item, "media", %{}) |> Map.get("m") end)
  end
end
