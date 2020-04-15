defmodule Shippo.Operation.Rate do
  @moduledoc """
  [Shippo Rate](https://goshippo.com/docs/reference#rates)
  """

  alias Shippo.Operation

  @doc """
  Retrieve an existing rate by object id.
  """
  @spec get(id :: binary(), opts :: keyword()) :: Operation.t()
  def get(id, opts \\ []) do
    path = Enum.join(["/rates", id], "/")

    Operation.new(:get, path, nil, opts)
  end
end
