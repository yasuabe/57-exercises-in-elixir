defmodule Elixir57ExercisesTest do
  use ExUnit.Case
  doctest Elixir57Exercises

  test "greets the world" do
    assert Elixir57Exercises.hello() == :world
  end
end
