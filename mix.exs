defmodule Elixir57Exercises.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_57_exercises,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:req, "~> 0.4"},
      {:jason, "~> 1.4"},
      {:plug, "~> 1.15"},
      {:plug_cowboy, "~> 2.6"}
    ]
  end
end
