defmodule Shippo.Operation.AddressTest do
  use ExUnit.Case, async: true
  alias Shippo.Operation
  alias Shippo.Operation.Address

  describe "create/1" do
    test "returns a Operations struct with :post and /addresses" do
      assert %Operation{
               http_method: :post,
               path: "/addresses",
               data: %{},
               opts: []
             } = Address.create(%{})
    end
  end

  describe "get/1" do
    test "returns a Operations struct with :get and /addresses/:id" do
      assert %Operation{
               http_method: :get,
               path: "/addresses/123",
               data: nil,
               opts: []
             } = Address.get("123")
    end
  end

  describe "list/0" do
    test "returns a Operations struct with :get and /addresses" do
      assert %Operation{
               http_method: :get,
               path: "/addresses",
               data: nil,
               opts: []
             } = Address.list()
    end
  end
end
