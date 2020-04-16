defmodule Shippo.Client.Hackney do
  @moduledoc """
  `hackney` client that implements the `Shippo.Client` behaviour.
  """

  @behaviour Shippo.Client

  @impl true
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
