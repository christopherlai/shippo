defmodule Shippo.Operation.CustomsDeclarationTest do
  use ExUnit.Case, async: true
  alias Shippo.Operation
  alias Shippo.Operation.CustomsDeclaration

  describe "create/1" do
    test "returns a Operations struct with :post and /customs/declarations" do
      assert %Operation{
               http_method: :post,
               path: "/customs/declarations",
               data: %{},
               opts: []
             } = CustomsDeclaration.create(%{})
    end
  end

  describe "get/1" do
    test "returns a Operations struct with :get and /customs/declarations/:id" do
      assert %Operation{
               http_method: :get,
               path: "/customs/declarations/123",
               data: nil,
               opts: []
             } = CustomsDeclaration.get("123")
    end
  end

  describe "list/0" do
    test "returns a Operations struct with :get and /customs/declarations" do
      assert %Operation{
               http_method: :get,
               path: "/customs/declarations",
               data: nil,
               opts: []
             } = CustomsDeclaration.list()
    end
  end
end
