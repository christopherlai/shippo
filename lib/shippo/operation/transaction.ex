defmodule Shippo.Operation.Transaction do
  @moduledoc """
  [Shippo Transactions](https://goshippo.com/docs/reference#transactions)
  """

  alias Shippo.Operation

  @doc """
  Creates a new transaction object and purchases the shipping label for the provided rate or in one API call.
  """
  @spec create(params :: map(), opts :: keyword()) :: Operation.t()
  def create(params, opts \\ []) do
    Operation.new(:post, "/transactions", params, opts)
  end

  @doc """
  Retrieve an existing transaction by object id.
  """
  @spec get(id :: binary(), opts :: keyword()) :: Operation.t()
  def get(id, opts \\ []) do
    path = Enum.join(["/transactions", id], "/")

    Operation.new(:get, path, nil, opts)
  end

  @doc """
  List all transaction objects.
  """
  @spec list :: Operation.t()
  def list(opts \\ []) do
    Operation.new(:get, "/transactions", nil, opts)
  end
end
