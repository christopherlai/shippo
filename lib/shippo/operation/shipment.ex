defmodule Shippo.Operation.Shipment do
  @moduledoc """
  [Shippo Shipments](https://goshippo.com/docs/reference#shipments)
  """

  alias Shippo.Operation

  @doc """
  Creates a new shipment object.
  """
  @spec create(params :: map(), opts :: keyword()) :: Operation.t()
  def create(params, opts \\ []) do
    Operation.new(:post, "/shipments", params, opts)
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

  @doc """
  Get shipping rates for a shipment.

  [https://goshippo.com/docs/reference#rates-get](https://goshippo.com/docs/reference#rates-get)
  """
  @spec rates(id :: binary(), currency :: binary()) :: Operation.t()
  def rates(id, currency) do
    path = Enum.join(["/shipments", id, "rates", currency], "/")

    Operation.new(:post, path, nil)
  end
end
