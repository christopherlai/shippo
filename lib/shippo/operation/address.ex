defmodule Shippo.Operation.Address do
  @moduledoc """
  [Shippo Addresses](https://goshippo.com/docs/reference#addresses)
  """

  alias Shippo.Operation

  @doc """
  Creates a new address object.
  """
  @spec create(params :: map(), opts :: keyword()) :: Operation.t()
  def create(params, _opts \\ []) do
    Operation.new(:post, "/addresses", params)
  end

  @doc """
  Retrieve an existing address by object id.

  """
  @spec get(id :: binary(), opts :: keyword()) :: Operation.t()
  def get(id, opts \\ []) do
    path = Enum.join(["/addresses", id], "/")

    Operation.new(:get, path, nil, opts)
  end

  @doc """
  Validate an existing address by object id.
  """
  @spec validate(id :: binary(), opts :: keyword()) :: Operation.t()
  def validate(id, opts \\ []) do
    path = Enum.join(["/addresses", id, "validate"], "/")

    Operation.new(:get, path, nil, opts)
  end

  @doc """
  List all addresses.
  """
  @spec list :: Operation.t()
  def list(opts \\ []) do
    Operation.new(:get, "/addresses", nil, opts)
  end
end
