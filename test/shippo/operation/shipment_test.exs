defmodule Shippo.Operation.ShipmentTest do
  use ExUnit.Case, async: true
  alias Shippo.Operation
  alias Shippo.Operation.Shipment

  describe "create/1" do
    test "returns a Operations struct with :post and /shipments" do
      assert %Operation{
               http_method: :post,
               path: "/shipments",
               data: %{},
               opts: []
             } = Shipment.create(%{})
    end
  end

  describe "get/1" do
    test "returns a Operations struct with :get and /shipments/:id" do
      assert %Operation{
               http_method: :get,
               path: "/shipments/123",
               data: nil,
               opts: []
             } = Shipment.get("123")
    end
  end

  describe "list/0" do
    test "returns a Operations struct with :get and /shipments" do
      assert %Operation{
               http_method: :get,
               path: "/shipments",
               data: nil,
               opts: []
             } = Shipment.list()
    end
  end

  describe "rates/2" do
    test "returns a Operations struct with :post and /shipments/:id/rates/:currency" do
      assert %Operation{
               http_method: :post,
               path: "/shipments/123/rates/USD",
               data: nil,
               opts: []
             } = Shipment.rates("123", "USD")
    end
  end
end
