defmodule Shippo.Operation.ManifestTest do
  use ExUnit.Case, async: true
  alias Shippo.Operation
  alias Shippo.Operation.Manifest

  describe "create/1" do
    test "returns a Operations struct with :post and /manifests" do
      assert %Operation{
               http_method: :post,
               path: "/manifests",
               data: %{},
               opts: []
             } = Manifest.create(%{})
    end
  end

  describe "get/1" do
    test "returns a Operations struct with :get and /manifests/:id" do
      assert %Operation{
               http_method: :get,
               path: "/manifests/123",
               data: nil,
               opts: []
             } = Manifest.get("123")
    end
  end

  describe "list/0" do
    test "returns a Operations struct with :get and /manifests" do
      assert %Operation{
               http_method: :get,
               path: "/manifests",
               data: nil,
               opts: []
             } = Manifest.list()
    end
  end
end
