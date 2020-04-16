defmodule Shippo.Operation.CarrierAccountTest do
  use ExUnit.Case, async: true
  alias Shippo.Operation
  alias Shippo.Operation.CarrierAccount

  describe "create/1" do
    test "returns a Operations struct with :post and /carrier_accounts" do
      assert %Operation{
               http_method: :post,
               path: "/carrier_accounts",
               data: %{},
               opts: []
             } = CarrierAccount.create(%{})
    end
  end

  describe "get/1" do
    test "returns a Operations struct with :get and /carrier_accounts/:id" do
      assert %Operation{
               http_method: :get,
               path: "/carrier_accounts/123",
               data: nil,
               opts: []
             } = CarrierAccount.get("123")
    end
  end

  describe "list/0" do
    test "returns a Operations struct with :get and /carrier_accounts" do
      assert %Operation{
               http_method: :get,
               path: "/carrier_accounts",
               data: nil,
               opts: []
             } = CarrierAccount.list()
    end
  end

  describe "update/2" do
    test "returns a Operations struct with :pust and /carrier_accounts/:id" do
      assert %Operation{
               http_method: :put,
               path: "/carrier_accounts/123",
               data: %{},
               opts: []
             } = CarrierAccount.update("123", %{})
    end
  end
end
