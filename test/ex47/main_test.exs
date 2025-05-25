defmodule Ex47.MainTest do
  use ExUnit.Case
  alias String, as: S

  test "column widths are max length + 2 of data row" do
    # ARRANGE
    people = [
      %{ "name" => "1"    , "craft" => "12345678901"},
      %{ "name" => "12345", "craft" => "1"          }]

    # ACT
    result = Ex47.Main.calc_max_widths(people)

    # ASSERT
    assert result == { 7, 13 }
  end

  test "column widths are not shorter than header texts" do
    # ARRANGE
    people = [
      %{ "name" => "a", "craft" => "a"}]

    # ACT
    result = Ex47.Main.calc_max_widths(people)

    # ASSERT
    assert result == { S.length(" Name "), S.length(" Spacecraft ") }
  end
end
