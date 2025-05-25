# Ex44: Product Search
#
# ・ Prompt user for a product name.
# ・ Load product data from a JSON file.
# ・ Search for a matching product.
# ・ If found, display its name, price, and quantity.
# ・ If not found, prompt again.

import Common.IoExt, only: [read_trimmed: 1]

defmodule Ex44.Main do
  @products_file_path "lib/ex44/data/products.json"

  def repeat_until_found(products) do
    name = read_trimmed("Enter a product name to search for: ")

    case Enum.find(products, &(&1["name"] == name)) do
      nil ->
        IO.puts("Sorry, that product was not found in our inventory.")
        repeat_until_found(products)

      %{"name" => n, "price" => p, "quantity" => q} ->
        IO.puts("Name: #{n}")
        IO.puts("Price: $#{:io_lib.format("~.2f", [p]) |> IO.iodata_to_binary()}")
        IO.puts("Quantity on Hand: #{q}")
    end
  end

  def run do
    with {:ok, json} <- File.read(@products_file_path),
         {:ok, data} <- Jason.decode(json) do
      repeat_until_found(data["products"])
    else
      {:error, reason} ->
        IO.puts("An error occurred: #{reason}.")
    end
  end
end
