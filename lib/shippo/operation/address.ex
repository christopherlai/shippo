defmodule Shippo.Operation.Address do
  alias Shippo.Operation

  @doc """
  Returns an `Operation` struct to create a new Address.
  """
  @spec create(params :: map(), opts :: keyword()) :: Operation.t()
  def create(params, _opts \\ []) do
    Operation.new(:post, "/addresses", params)
  end

  @doc """
  Returns an `Operation` struct for listing all Addresses.
  """
  @spec list :: Operation.t()
  def list(opts \\ []) do
    Operation.new(:get, "/addresses", nil, opts)
  end
end
