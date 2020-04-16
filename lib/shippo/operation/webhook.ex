defmodule Shippo.Operation.Webhook do
  @moduledoc """
  [Shippo Webhook](https://goshippo.com/docs/webhooks/)
  """

  alias Shippo.Operation

  @doc """
  Creates a new webhook object.
  """
  @spec create(params :: map(), opts :: keyword()) :: Operation.t()
  def create(params, _opts \\ []) do
    Operation.new(:post, "/webhooks", params)
  end

  @doc """
  Retrieve an existing webhook by object id.
  """
  @spec get(id :: binary(), opts :: keyword()) :: Operation.t()
  def get(id, opts \\ []) do
    path = Enum.join(["/webhooks", id], "/")

    Operation.new(:get, path, nil, opts)
  end

  @doc """
  List all webhook objects.
  """
  @spec list :: Operation.t()
  def list(opts \\ []) do
    Operation.new(:get, "/webhooks", nil, opts)
  end

  @doc """
  Update an existing webhook object.
  """
  @spec update(id :: binary(), params :: map(), opts :: keyword()) :: Operation.t()
  def update(id, params, opts \\ []) do
    path = Enum.join(["/webhooks", id], "/")

    Operation.new(:put, path, params, opts)
  end
end
