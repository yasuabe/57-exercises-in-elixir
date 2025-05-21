# Ex10: Self-Checkout
#
# ・Prompt for price and quantity of 3 items.
# ・Calculate subtotal, then 5.5% tax, then total.
# ・Print each line item, subtotal, tax, and total.
# ・Separate input, processing, and output logic.
# ・Ensure all input is converted to numeric types before calculations.

import Common.Stdio

defmodule Ex10.Main do
  def read_price_cent(n) do
    read_valid(
      "Enter the price of item #{n}: ",
      "Invalid price.",
      fn str ->
        case Regex.run(~r/^(0|[1-9][0-9]*)(\.[0-9]{1,2})?$/, String.trim(str), capture: :first) do
          nil -> :error
          [s] -> String.trim(s) |> Float.parse() |> elem(0)
        end
      end
    )
  end

  def read_quantity(n) do
    read_int("Enter the quantity of item #{n}: ", "Invalid quantity")
  end

  def read_item(n) do
    price    = read_price_cent(n) * 100
    quantity = read_quantity(n)
    {price, quantity}
  end

  def read_items do
    Enum.map(1..3, &read_item/1)
  end

  def calculate_subtotal(items) do
    Enum.reduce(items, 0.0, fn {price, quantity}, acc ->
      acc + price * quantity
    end)
  end

  def make_receipt(items) do
    subtotal = calculate_subtotal(items)
    tax      = subtotal * 0.055
    total    = subtotal + tax

    {round(subtotal), round(tax), round(total)}
  end

  def print_receipt({subtotal, tax, total}) do
    fmt = &(:io.format("$~s: $~.2f\n", [&1, &2 / 100]))

    fmt.("Subtotal", subtotal)
    fmt.("Tax"     , tax)
    fmt.("Total"   , total)
  end

  def run do
    items   = read_items()
    receipt = make_receipt(items)

    print_receipt receipt
  end
end
