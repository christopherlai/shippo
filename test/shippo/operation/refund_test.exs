defmodule Shippo.Operation.RefundTest do
  use ExUnit.Case, async: true
  alias Shippo.Operation
  alias Shippo.Operation.Refund

  describe "create/1" do
    test "returns a Operations struct with :post and /refunds" do
      assert %Operation{
               http_method: :post,
               path: "/refunds",
               data: %{},
               opts: []
             } = Refund.create(%{})
    end
  end

  describe "get/1" do
    test "returns a Operations struct with :get and /refunds/:id" do
      assert %Operation{
               http_method: :get,
               path: "/refunds/123",
               data: nil,
               opts: []
             } = Refund.get("123")
    end
  end

  describe "list/0" do
    test "returns a Operations struct with :get and /refunds" do
      assert %Operation{
               http_method: :get,
               path: "/refunds",
               data: nil,
               opts: []
             } = Refund.list()
    end
  end
end
