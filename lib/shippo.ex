defmodule Shippo do
  @moduledoc """
  Documentation for Shippo.
  """

  alias Shippo.Request
  alias Shippo.Configuration

  def request(operation, overrides \\ [])

  def request(url, overrides) when is_binary(url) do
    config = Configuration.new(overrides)
    headers = Request.headers(config)
    client = config.client
    parser = config.json_library

    :get
    |> client.request(url, headers, "")
    |> handle_response(parser)
  end

  def request(operation, overrides) do
    config = Configuration.new(overrides)
    url = Request.url(config, operation)
    headers = Request.headers(config)
    method = operation.http_method
    body = Request.body(config, operation)
    client = config.client
    parser = config.json_library

    method
    |> client.request(url, headers, body)
    |> handle_response(parser)
  end

  defp handle_response({:ok, %{status_code: code, body: body}}, parser)
       when code in 200..299 or code == 304 do
    {:ok, parser.decode!(body)}
  end

  defp handle_response({:ok, %{status_code: code, body: body}}, parser) when code == 304 do
    {:ok, parser.decode!(body)}
  end

  defp handle_response({:ok, %{status_code: code, body: body}}, _parser) when code >= 400 do
    {:error, "Unable to complete request. Status Code: #{code} with body: #{body}"}
  end

  defp handle_response({:error, %{reason: reason}}, _parser) do
    {:error, reason}
  end
end
