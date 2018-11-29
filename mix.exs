defmodule TitleFetch.MixProject do
  use Mix.Project

  def project do
    [
      app: :title_fetch,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      erlc_options: [:debug_info]
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
      {:idna, path: "../erlang-idna", override: true},
      {:hackney, path: "../hackney", override: true},
      {:httpoison, "~> 1.4"},
      {:floki, "~> 0.20.0"}
    ]
  end
end
