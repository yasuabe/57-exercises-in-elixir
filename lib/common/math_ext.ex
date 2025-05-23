defmodule Common.MathExt do
  def div_mod(x, y) do
    {div(x, y), rem(x, y)}
  end
end
