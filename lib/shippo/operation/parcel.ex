defmodule Shippo.Operation.Parcel do
  @moduledoc """
  [Shippo Parcels](https://goshippo.com/docs/reference#parcels)
  """

  alias Shippo.Operation

  @doc """
  Creates a new parcel object.
  """
  @spec create(params :: map(), opts :: keyword()) :: Operation.t()
  def create(params, opts \\ []) do
    Operation.new(:post, "/parcels", params, opts)
  end

  @doc """
  Retrieve an existing parcel by object id.
  """
  @spec get(id :: binary(), opts :: keyword()) :: Operation.t()
  def get(id, opts \\ []) do
    path = Enum.join(["/parcels", id], "/")

    Operation.new(:get, path, nil, opts)
  end

  @doc """
  List all parcel objects.
  """
  @spec list :: Operation.t()
  def list(opts \\ []) do
    Operation.new(:get, "/parcels", nil, opts)
  end
end
