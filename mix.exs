defmodule Plug.ResponseHeader.Mixfile do
  use Mix.Project

  def project do
    [app: :plug_response_header,
     version: "0.1.0",
     elixir: ">= 1.0.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 0.11.0"}
    ]
  end

end
