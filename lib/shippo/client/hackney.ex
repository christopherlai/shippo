defmodule Shippo.Client.Hackney do
  @behaviour Shippo.Client

  def request(method, url, headers, body, opts \\ []) do
    case :hackney.request(method, url, headers, body, [:with_body] ++ opts) do
      {:ok, status, _headers, body} ->
        {:ok, %{status_code: status, body: body}}

      {:ok, status, _headers} ->
        {:ok, %{status_code: status, body: "{}"}}

      {:error, reason} ->
        {:error, %{reason: reason}}
    end
  end
end
