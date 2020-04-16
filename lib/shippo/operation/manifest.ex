defmodule Shippo.Operation.Manifest do
  @moduledoc """
  [Shippo Manifests](https://goshippo.com/docs/reference#manifests)
  """

  alias Shippo.Operation

  @doc """
  Creates a new manifest object.
  """
  @spec create(params :: map(), opts :: keyword()) :: Operation.t()
  def create(params, _opts \\ []) do
    Operation.new(:post, "/manifests", params)
  end

  @doc """
  Retrieve an existing manifest by object id.
  """
  @spec get(id :: binary(), opts :: keyword()) :: Operation.t()
  def get(id, opts \\ []) do
    path = Enum.join(["/manifests", id], "/")

    Operation.new(:get, path, nil, opts)
  end

  @doc """
  List all Manifest objects.
  """
  @spec list :: Operation.t()
  def list(opts \\ []) do
    Operation.new(:get, "/manifests", nil, opts)
  end
end
