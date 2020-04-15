defmodule Shippo.Operation.Shipment do
  @moduledoc """
  [Shippo Shipment](https://goshippo.com/docs/reference#shipments)
  """

  alias Shippo.Operation

  @doc """
  Creates a new shipment object.
  """
  @spec create(params :: map(), opts :: keyword()) :: Operation.t()
  def create(params, _opts \\ []) do
    Operation.new(:post, "/shipments", params)
  end

  @doc """
  Retrieve an existing shipment by object id.
  """
  @spec get(id :: binary(), opts :: keyword()) :: Operation.t()
  def get(id, opts \\ []) do
    path = Enum.join(["/shipments", id], "/")

    Operation.new(:get, path, nil, opts)
  end

  @doc """
  List all shipment objects.
  """
  @spec list :: Operation.t()
  def list(opts \\ []) do
    Operation.new(:get, "/shipments", nil, opts)
  end
end
