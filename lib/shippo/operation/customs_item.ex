defmodule Shippo.Operation.CustomsItems do
  @moduledoc """
  [Shippo Customs Items](https://goshippo.com/docs/reference#customs-items)
  """

  alias Shippo.Operation

  @doc """
  Creates a new Customs Item object.
  """
  @spec create(params :: map(), opts :: keyword()) :: Operation.t()
  def create(params, _opts \\ []) do
    Operation.new(:post, "/customs/items", params)
  end

  @doc """
  Retrieve an existing Customs Item by object id.

  """
  @spec get(id :: binary(), opts :: keyword()) :: Operation.t()
  def get(id, opts \\ []) do
    path = Enum.join(["/customs/items", id], "/")

    Operation.new(:get, path, nil, opts)
  end

  @doc """
  List all custom-items objects.
  """
  @spec list :: Operation.t()
  def list(opts \\ []) do
    Operation.new(:get, "/customs/items", nil, opts)
  end
end
