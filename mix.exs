defmodule PlugResponseHeader.Mixfile do
  use Mix.Project

  def project do
    [
      app: :plug_response_header,
      version: "0.1.0",
      elixir: ">= 1.0.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      description: "This plug allows manipulation of HTTP response headers",
      package: package,
    ]
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

  defp package do
    %{
      contributors: ["Constantin Rack"],
      licenses: ["Apache License 2.0"],
      links: %{"Github" => "https://github.com/c-rack/plug_response_header"}
    }
  end  

end
