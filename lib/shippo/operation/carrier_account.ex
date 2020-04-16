defmodule Shippo.Operation.CarrierAccount do
  @moduledoc """
  [Shippo Carrier Accounts](https://goshippo.com/docs/reference#carrier-accounts)
  """

  alias Shippo.Operation

  @doc """
  Creates a new carrier account object.
  """
  @spec create(params :: map(), opts :: keyword()) :: Operation.t()
  def create(params, opts \\ []) do
    Operation.new(:post, "/carrier_accounts", params, opts)
  end

  @doc """
  Retrieve an existing carrier account by object id.
  """
  @spec get(id :: binary(), opts :: keyword()) :: Operation.t()
  def get(id, opts \\ []) do
    path = Enum.join(["/carrier_accounts", id], "/")

    Operation.new(:get, path, nil, opts)
  end

  @doc """
  List all carrier accounts.
  """
  @spec list :: Operation.t()
  def list(opts \\ []) do
    Operation.new(:get, "/carrier_accounts", nil, opts)
  end

  @doc """
  Update an existing carrier account object.
  """
  @spec update(id :: binary(), params :: map(), opts :: keyword()) :: Operation.t()
  def update(id, params, opts \\ []) do
    path = Enum.join(["/carrier_accounts", id], "/")

    Operation.new(:put, path, params, opts)
  end
end
