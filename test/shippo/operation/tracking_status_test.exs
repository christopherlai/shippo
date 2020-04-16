defmodule Shippo.Operation.TrackingStatusTest do
  use ExUnit.Case, async: true
  alias Shippo.Operation
  alias Shippo.Operation.TrackingStatus

  describe "create/1" do
    test "returns a Operations struct with :post and /tracks" do
      assert %Operation{
               http_method: :post,
               path: "/tracks",
               data: %{},
               opts: []
             } = TrackingStatus.create(%{})
    end
  end

  describe "get/1" do
    test "returns a Operations struct with :get and /tracks/:carrier/:id" do
      assert %Operation{
               http_method: :get,
               path: "/tracks/usps/123",
               data: nil,
               opts: []
             } = TrackingStatus.get("123", "usps")
    end
  end
end
