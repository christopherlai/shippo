defmodule Shippo.Operation.BatchTest do
  use ExUnit.Case, async: true
  alias Shippo.Operation
  alias Shippo.Operation.Batch

  describe "create/1" do
    test "returns a Operations struct with :post and /batches" do
      assert %Operation{
               http_method: :post,
               path: "/batches",
               data: %{},
               opts: []
             } = Batch.create(%{})
    end
  end

  describe "get/1" do
    test "returns a Operations struct with :get and /batches/:id" do
      assert %Operation{
               http_method: :get,
               path: "/batches/123",
               data: nil,
               opts: []
             } = Batch.get("123")
    end
  end

  describe "add_shipments/2" do
    test "returns a Operations struct with :post and /batches/:id/add_shipments" do
      assert %Operation{
               http_method: :post,
               path: "/batches/123/add_shipments",
               data: [],
               opts: []
             } = Batch.add_shipments("123", [])
    end
  end

  describe "remove_shipments/2" do
    test "returns a Operations struct with :post and /batches/:id/remove_shipments" do
      assert %Operation{
               http_method: :post,
               path: "/batches/123/remove_shipments",
               data: [],
               opts: []
             } = Batch.remove_shipments("123", [])
    end
  end

  describe "purchase/2" do
    test "returns a Operations struct with :psot and /batches/:id/purchase" do
      assert %Operation{
               http_method: :post,
               path: "/batches/123/purchase",
               data: nil,
               opts: []
             } = Batch.purchase("123", [])
    end
  end
end
