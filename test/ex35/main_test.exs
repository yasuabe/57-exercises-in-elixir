defmodule Ex35.MainTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "no names entered" do
    output = capture_io([input: "\n"], fn ->
      Ex35.Main.run()
    end)
    assert output =~ "No names were entered.\n"
  end

  test "single name entered" do
    input = "Alice\n\n"
    output = capture_io([input: input], fn ->
      Ex35.Main.run()
    end)
    assert output =~ "The winner is Alice.\n"
  end

  test "multiple names entered" do
    input = "Alice\nBob\nCharlie\n\n"
    output = capture_io([input: input], fn ->
      Ex35.Main.run()
    end)
    winner = Regex.named_captures(~r/The winner is (?<winner>.*)\.$/, output)["winner"]

    assert String.contains?(output, "The winner is ")
    assert input =~ winner
  end
end
