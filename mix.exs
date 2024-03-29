defmodule CrankWheel.MixProject do
  use Mix.Project

  @description """
    Simple Elixir wrapper for the CrankWheel API
  """

  def project do
    [
      app: :crank_wheel,
      version: "0.1.0",
      elixir: "~> 1.8",
      name: "CrankWheel",
      description: @description,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
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
      {:httpoison, "~> 1.4"},
      {:exjsx, "~> 4.0"},
      {:excoveralls, "~> 0.10", only: :test},
      {:mock, "~> 0.3.0", only: :test},
      {:exvcr, "~> 0.10", only: :test}
    ]
  end
end
