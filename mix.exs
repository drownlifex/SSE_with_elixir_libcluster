defmodule Prueba1.MixProject do
  use Mix.Project

  def project do
    [
      app: :sse_pub_sub_cluster,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Ssepubsub.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dotenv, "~> 3.1"},
      {:libcluster, "~> 3.3"},
      {:plug, "~> 1.11"},
      {:plug_cowboy, "~> 2.0"},
      {:phoenix_pubsub, "~> 2.0"},

    ]
  end
end
