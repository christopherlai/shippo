defmodule Shippo.Operation.TrackingStatus do
  @moduledoc """
  [Shippo Tracking status](https://goshippo.com/docs/reference#tracks)
  """

  alias Shippo.Operation

  @doc """
  Register a webhook(s) for a Shipment (and request the current status at the same time) by `POST`ing to the tracking endpoint.
  """
  @spec create(params :: map(), opts :: keyword()) :: Operation.t()
  def create(params, opts \\ []) do
    Operation.new(:post, "/tracks", params, opts)
  end

  @doc """
  Request the tracking status of a shipment by sending a GET request.
  """
  @spec get(tracking_number :: binary(), carrier :: binary(), opts :: keyword()) :: Operation.t()
  def get(tracking_number, carrier, opts \\ []) do
    path = Enum.join(["/tracks", carrier, tracking_number], "/")

    Operation.new(:get, path, nil, opts)
  end
end
