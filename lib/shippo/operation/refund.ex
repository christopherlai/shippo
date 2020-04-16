defmodule Shippo.Operation.Refund do
  @moduledoc """
  [Shippo Refunds](https://goshippo.com/docs/reference#refunds)
  """

  alias Shippo.Operation

  @doc """
  Creates a new refund object.
  """
  @spec create(params :: map(), opts :: keyword()) :: Operation.t()
  def create(params, opts \\ []) do
    Operation.new(:post, "/refunds", params, opts)
  end

  @doc """
  Retrieve an existing refund by object id.
  """
  @spec get(id :: binary(), opts :: keyword()) :: Operation.t()
  def get(id, opts \\ []) do
    path = Enum.join(["/refunds", id], "/")

    Operation.new(:get, path, nil, opts)
  end

  @doc """
  List all refund objects.
  """
  @spec list :: Operation.t()
  def list(opts \\ []) do
    Operation.new(:get, "/refunds", nil, opts)
  end
end
