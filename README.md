# PlugResponseHeader [![Hex.pm Version](http://img.shields.io/hexpm/v/plug_response_header.svg)](https://hex.pm/packages/plug_response_header)


This [Elixir](http://elixir-lang.org/) [plug](https://github.com/elixir-lang/plug) allows manipulation of [HTTP](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol) response headers:

* Deleting one or more HTTP response headers.
* Setting one or more HTTP response headers.
* Setting the HTTP "Server" response header.

This plug supports the following options. At least one option must be specified.

* `delete`: a bitstring or a list of bitstrings of header keys to be deleted.
* `server`: convenience function for `set: ["server": "MyServer"]`
* `set`: a list of key/value pairs for headers to be set.

## Setup

To use the plug in your projects, edit your mix.exs file and add the project as a dependency:

```elixir
defp deps do
  [
    {:plug_response_header, "~> 0.2.1"}
  ]
end
```

## Usage

```elixir
pipeline :browser do
  plug PlugResponseHeader,
    delete: "x-request-id",
    server: "MyServer",
    set: [
      "strict-transport-security": "max-age=31536000",
      "cache-control": "no-transform"
    ]
    ...
end
```

## License

[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)
