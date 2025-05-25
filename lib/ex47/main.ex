# Ex47: Who’s in Space?
#
# - Access live data from the Open Notify API (http://api.open-notify.org/astros.json).
# - Parse the JSON response.
# - Display:
#     - Total number of people in space.
#     - A table of names and spacecraft.
# - Do not use pre-downloaded data.

defmodule Ex47.Main do
  alias String, as: S
  @url "http://api.open-notify.org/astros.json"

  def calc_max_widths(people) do
    {min_name_width, min_craft_width} = {S.length("Name"), S.length("Spacecraft")}

    {name_max, craft_max} =
      Enum.reduce(
        people,
        {min_name_width, min_craft_width},
        fn person, {name_acc, craft_acc} ->
          {max(name_acc, S.length(person["name"])), max(craft_acc, S.length(person["craft"]))}
        end
      )

    {name_max + 2, craft_max + 2}
  end

  def run do
    {:ok, response} = Req.get(@url)

    json   = response.body
    people = json["people"]
    number = json["number"]

    {name_width, craft_width} = calc_max_widths(people)
    pad_name  = &S.pad_trailing(&1, name_width)
    pad_craft = &S.pad_trailing(&1, craft_width)

    IO.puts("There are currently #{number} people in space.\n")

    IO.puts(" #{pad_name.("Name")} | #{pad_craft.("Spacecraft")}")
    IO.puts(S.duplicate("-", name_width + craft_width + 1))

    Enum.each(people, fn person ->
      IO.puts(" #{pad_name.(person["name"])} | #{pad_craft.(person["craft"])}")
    end)
  end
end
