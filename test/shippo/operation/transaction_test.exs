defmodule Shippo.Operation.TransactionTest do
  use ExUnit.Case, async: true
  alias Shippo.Operation
  alias Shippo.Operation.Transaction

  describe "create/1" do
    test "returns a Operations struct with :post and /transactions" do
      assert %Operation{
               http_method: :post,
               path: "/transactions",
               data: %{},
               opts: []
             } = Transaction.create(%{})
    end
  end

  describe "get/1" do
    test "returns a Operations struct with :get and /transactions/:id" do
      assert %Operation{
               http_method: :get,
               path: "/transactions/123",
               data: nil,
               opts: []
             } = Transaction.get("123")
    end
  end

  describe "list/0" do
    test "returns a Operations struct with :get and /transactions" do
      assert %Operation{
               http_method: :get,
               path: "/transactions",
               data: nil,
               opts: []
             } = Transaction.list()
    end
  end
end
