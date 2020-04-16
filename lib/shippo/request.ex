defmodule Shippo.Request do
  @moduledoc """
  Helper functions for building the url, headers and body of a request.
  """

  alias Shippo.Configuration
  alias Shippo.Operation

  @doc """
  Returns a binary representing the request URL.
  """
  @spec url(configuration :: Configuration.t(), operation :: Operation.t()) :: binary()
  def url(configuration, operation) do
    configuration.url
    |> URI.parse()
    |> put_path(operation.path)
    |> put_query(operation.opts)
    |> URI.to_string()
  end

  @doc """
  Returns a list of tuples representing the request headers.
  """
  @spec headers(configuration :: Configuration.t()) :: [tuple()]
  def headers(configuration) do
    authorization_header = {"authorization", "ShippoToken " <> configuration.token}

    []
    |> List.keystore("authorization", 0, authorization_header)
    |> List.keystore("content-type", 0, {"content-type", "application/json"})
  end

  @doc """
  Returns a binary representing the request body.
  """
  @spec body(configuration :: Configuration.t(), operation :: Operation.t()) :: binary()
  def body(%Configuration{}, %Operation{data: data}) when is_nil(data), do: ""

  def body(%Configuration{}, %Operation{data: ""}), do: ""

  def body(%Configuration{json_library: encoder}, %Operation{data: data}) do
    encoder.encode!(data)
  end

  @spec put_path(uri :: URI.t(), path :: binary()) :: URI.t()
  defp put_path(uri, path) do
    %{uri | path: path}
  end

  @spec put_query(uri :: URI.t(), query :: [] | keyword()) :: URI.t()
  defp put_query(uri, []), do: uri

  defp put_query(uri, query) do
    %{uri | query: URI.encode_query(query)}
  end
end
