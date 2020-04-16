defmodule Shippo.Operation.OrderTest do
  use ExUnit.Case, async: true
  alias Shippo.Operation
  alias Shippo.Operation.Order

  describe "create/1" do
    test "returns a Operations struct with :post and /orders" do
      assert %Operation{
               http_method: :post,
               path: "/orders",
               data: %{},
               opts: []
             } = Order.create(%{})
    end
  end

  describe "get/1" do
    test "returns a Operations struct with :get and /orders/:id" do
      assert %Operation{
               http_method: :get,
               path: "/orders/123",
               data: nil,
               opts: []
             } = Order.get("123")
    end
  end

  describe "list/0" do
    test "returns a Operations struct with :get and /orders" do
      assert %Operation{
               http_method: :get,
               path: "/orders",
               data: nil,
               opts: []
             } = Order.list()
    end
  end
end
