defmodule Shippo.Operation.CustomsItemTest do
  use ExUnit.Case, async: true
  alias Shippo.Operation
  alias Shippo.Operation.CustomsItem

  describe "create/1" do
    test "returns a Operations struct with :post and /customs/items" do
      assert %Operation{
               http_method: :post,
               path: "/customs/items",
               data: %{},
               opts: []
             } = CustomsItem.create(%{})
    end
  end

  describe "get/1" do
    test "returns a Operations struct with :get and /customs/items/:id" do
      assert %Operation{
               http_method: :get,
               path: "/customs/items/123",
               data: nil,
               opts: []
             } = CustomsItem.get("123")
    end
  end

  describe "list/0" do
    test "returns a Operations struct with :get and /customs/items" do
      assert %Operation{
               http_method: :get,
               path: "/customs/items",
               data: nil,
               opts: []
             } = CustomsItem.list()
    end
  end
end
