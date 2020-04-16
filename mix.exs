defmodule Shippo.MixProject do
  use Mix.Project

  @name :shippo
  @version "0.1.0"
  @url "https://github.com/christopherlai/shippo"

  def project do
    [
      app: @name,
      version: @version,
      description: "Wrapper for the Shippo API",
      source_url: @url,
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.3", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:hackney, "~> 1.15", optional: true},
      {:jason, "~> 1.2", optional: true}
    ]
  end

  defp package do
    [
      name: @name,
      licenses: ["MIT"],
      links: %{github: @url}
    ]
  end
end
