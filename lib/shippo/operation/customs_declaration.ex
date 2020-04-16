defmodule Shippo.Operation.CustomsDeclaration do
  @moduledoc """
  [Shippo Customs Declarations](https://goshippo.com/docs/reference#customs-declarations)
  """

  alias Shippo.Operation

  @doc """
  Creates a new Customs Declaration object.
  """
  @spec create(params :: map(), opts :: keyword()) :: Operation.t()
  def create(params, _opts \\ []) do
    Operation.new(:post, "/customs/declarations", params)
  end

  @doc """
  List all customs-declaration objects.

  """
  @spec get(id :: binary(), opts :: keyword()) :: Operation.t()
  def get(id, opts \\ []) do
    path = Enum.join(["/customs/declarations", id], "/")

    Operation.new(:get, path, nil, opts)
  end

  @doc """
  Retrieve an existing customs-declaration by object id.
  """
  @spec list :: Operation.t()
  def list(opts \\ []) do
    Operation.new(:get, "/customs/declarations", nil, opts)
  end
end
