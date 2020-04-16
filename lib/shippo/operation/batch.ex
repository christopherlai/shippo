defmodule Shippo.Operation.Batch do
  @moduledoc """
  [Shippo Batches](https://goshippo.com/docs/reference#batches)
  """

  alias Shippo.Operation

  @doc """
  Creates a new batch object which allows you to purchase shipping labels for many shipments with one API call.
  """
  @spec create(params :: map(), opts :: keyword()) :: Operation.t()
  def create(params, _opts \\ []) do
    Operation.new(:post, "/batches", params)
  end

  @doc """
  Retrieve an existing batch by object id.
  """
  @spec get(id :: binary(), opts :: keyword()) :: Operation.t()
  def get(id, opts \\ []) do
    path = Enum.join(["/batches", id], "/")

    Operation.new(:get, path, nil, opts)
  end

  @doc """
  Add batch shipments to an existing batch.
  """
  @spec add_shipments(id :: binary(), params :: [map()], opts :: keyword()) :: Operation.t()
  def add_shipments(id, params, _opts \\ []) do
    path = Enum.join(["/batches", id, "add_shipments"], "/")

    Operation.new(:post, path, params)
  end

  @doc """
  Remove batch shipments from an existing batch.
  """
  @spec remove_shipments(id :: binary(), params :: [binary()], opts :: keyword()) :: Operation.t()
  def remove_shipments(id, params, _opts \\ []) do
    path = Enum.join(["/batches", id, "remove_shipments"], "/")

    Operation.new(:post, path, params)
  end

  @doc """
  Purchase an existing batch.
  """
  @spec purchase(id :: binary(), opts :: keyword()) :: Operation.t()
  def purchase(id, _opts \\ []) do
    path = Enum.join(["/batches", id, "purchase"], "/")

    Operation.new(:post, path, nil)
  end
end
