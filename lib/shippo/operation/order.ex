defmodule Shippo.Operation.Order do
  @moduledoc """
  [Shippo Order](https://goshippo.com/docs/reference#parcels)
  """

  alias Shippo.Operation

  @doc """
  Creates a new order object.
  """
  @spec create(params :: map(), opts :: keyword()) :: Operation.t()
  def create(params, opts \\ []) do
    Operation.new(:post, "/orders", params, opts)
  end

  @doc """
  Retrieve an existing order by object id.
  """
  @spec get(id :: binary(), opts :: keyword()) :: Operation.t()
  def get(id, opts \\ []) do
    path = Enum.join(["/orders", id], "/")

    Operation.new(:get, path, nil, opts)
  end

  @doc """
  List all order objects.
  """
  @spec list :: Operation.t()
  def list(opts \\ []) do
    Operation.new(:get, "/orders", nil, opts)
  end
end
