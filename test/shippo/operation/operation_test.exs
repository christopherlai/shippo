defmodule Shippo.OperationTest do
  use ExUnit.Case, async: true
  alias Shippo.Operation

  describe "new/2" do
    test "returns an Operation struct" do
      assert %Operation{
               http_method: :get,
               path: "/",
               data: "",
               opts: []
             } = Operation.new(:get, "/")
    end
  end

  describe "new/3" do
    test "returns an Operation struct" do
      assert %Operation{
               http_method: :get,
               path: "/",
               data: %{key: "value"},
               opts: []
             } = Operation.new(:get, "/", %{key: "value"})
    end
  end

  describe "new/4" do
    test "returns an Operation struct" do
      assert %Operation{
               http_method: :get,
               path: "/",
               data: %{key: "value"},
               opts: [results: 5]
             } = Operation.new(:get, "/", %{key: "value"}, results: 5)
    end
  end
end
