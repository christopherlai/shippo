defmodule Shippo.Operation.WebhookTest do
  use ExUnit.Case, async: true
  alias Shippo.Operation
  alias Shippo.Operation.Webhook

  describe "create/1" do
    test "returns a Operations struct with :post and /webhooks" do
      assert %Operation{
               http_method: :post,
               path: "/webhooks",
               data: %{},
               opts: []
             } = Webhook.create(%{})
    end
  end

  describe "get/1" do
    test "returns a Operations struct with :get and /webhooks/:id" do
      assert %Operation{
               http_method: :get,
               path: "/webhooks/123",
               data: nil,
               opts: []
             } = Webhook.get("123")
    end
  end

  describe "list/0" do
    test "returns a Operations struct with :get and /webhooks" do
      assert %Operation{
               http_method: :get,
               path: "/webhooks",
               data: nil,
               opts: []
             } = Webhook.list()
    end
  end

  describe "update/2" do
    test "returns a Operations struct with :pust and /webhooks/:id" do
      assert %Operation{
               http_method: :put,
               path: "/webhooks/123",
               data: %{},
               opts: []
             } = Webhook.update("123", %{})
    end
  end
end
