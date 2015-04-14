defmodule Plug.ResponseHeader do
  
  @moduledoc """
  This plug allows manipulation of HTTP response headers:

  * Deleting one or more HTTP response headers.
  * Setting one or more HTTP response headers.
  * Setting the HTTP "Server" response header.

  This plug supports the following options. At least one option must be specified.

  * `delete`: a bitstring or a list of bitstrings of header keys to be deleted.
  * `server`: convenience function for `set: ["server": "MyServer"]`
  * `set`: a list of key/value pairs for headers to be set.

  ## Example

    pipeline :browser do
      plug Plug.ResponseHeader,
        delete: "x-request-id",
        server: "MyServer",
        set: ["Strict-Transport-Security": "max-age=31536000"]
      ...
    end

  """
  
  import Plug.Conn, only: [delete_resp_header: 2, update_resp_header: 4]

  @doc "Callback implementation for Plug.init/1"
  def init([]), do: raise "Please set at least one option or remove Plug.ResponseHeader"
  def init(options), do: options

  @doc "Callback implementation for Plug.call/2"
  def call(conn, options) do
    conn
    |> delete(options[:delete])
    |> set(options[:set])
    |> set("server", options[:server])
  end

  defp set(conn, nil), do: conn
  defp set(conn, list) when list |> is_list do
    List.foldl(list, conn, fn({key, value}, conn) -> set(conn, Atom.to_string(key), value) end)
  end
  defp set(conn, _key, nil), do: conn
  defp set(conn, key, value) when value |> is_bitstring do
    update_resp_header(conn, key, value, fn(_) -> value end)
  end

  defp delete(conn, nil), do: conn
  defp delete(conn, []), do: conn
  defp delete(conn, key) when key |> is_bitstring, do: delete(conn, [key])
  defp delete(conn, [h|t]) when h |> is_bitstring do
    conn
    |> delete_resp_header(h)
    |> delete(t)
  end

end
