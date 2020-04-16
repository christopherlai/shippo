defmodule Shippo.Operation.ParcelTest do
  use ExUnit.Case, async: true
  alias Shippo.Operation
  alias Shippo.Operation.Parcel

  describe "create/1" do
    test "returns a Operations struct with :post and /parcels" do
      assert %Operation{
               http_method: :post,
               path: "/parcels",
               data: %{},
               opts: []
             } = Parcel.create(%{})
    end
  end

  describe "get/1" do
    test "returns a Operations struct with :get and /parcels/:id" do
      assert %Operation{
               http_method: :get,
               path: "/parcels/123",
               data: nil,
               opts: []
             } = Parcel.get("123")
    end
  end

  describe "list/0" do
    test "returns a Operations struct with :get and /parcels" do
      assert %Operation{
               http_method: :get,
               path: "/parcels",
               data: nil,
               opts: []
             } = Parcel.list()
    end
  end
end
