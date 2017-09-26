defmodule PlugSessionMnesia.Mixfile do
  use Mix.Project

  def project do
    [
      app: :plug_session_mnesia,
      version: "0.1.0-dev",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      dialyzer: [
        plt_add_deps: :transitive,
        flags: [:unmatched_returns, :error_handling, :race_conditions],
        ignore_warnings: ".dialyzer-ignore",
      ],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        "coveralls": :test,
        "coveralls.detail": :test,
        "coveralls.html": :test,
      ],
    ]
  end

  def application do
    [
      extra_applications: [:mnesia, :logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 0.8.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 0.5.1", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.7.3", only: :test, runtime: false},
      {:mix_test_watch, "~> 0.5.0", only: :dev, runtime: false},
      {:ex_unit_notifier, "~> 0.1.4", only: :test, runtime: false},
      {:ex_doc, "~> 0.16.4", only: :dev, runtime: false},
    ]
  end
end