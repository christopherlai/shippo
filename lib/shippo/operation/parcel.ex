defmodule Shippo.Operation.Parcel do
  @moduledoc """
  [Shippo Parcel](https://goshippo.com/docs/reference#parcels)
  """

  alias Shippo.Operation

  @doc """
  Creates a new parcel object.

  ## Examples
  ```
  params = %{
    length: 10.0, # decimal (required)
    width: 10.0, # decimal (required)
    height: 10.0, # decimal (required)
    distance_unit: "in", # "cm", "in", "ft", "mm", "m", "yd" (required)
    weight: 10.4, # decimal (required)
    mass_unit: "lb", # "g", "oz", "lb", "kg" (required)
    template: "", # string (optional)
    extra: %{}, # map (optional)
    metadata: "" # string (optional)
  }

  params
  |> Shippo.Operation.Parcel.create()
  |> Shippo.request()
  ```
  """
  @spec create(params :: map(), opts :: keyword()) :: Operation.t()
  def create(params, _opts \\ []) do
    Operation.new(:post, "/parcels", params)
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
