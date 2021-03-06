defmodule Shippo.Client do
  @moduledoc """
  HTTP Client Behaviour.
  """

  @type return :: {:ok, %{status_code: integer(), body: any()}} | {:error, %{reason: any()}}

  @callback request(
              method :: atom(),
              url :: binary(),
              header :: [tuple()],
              body :: any(),
              opts :: keyword()
            ) :: return()
end
