defmodule Shippo.Operation.RateTest do
  use ExUnit.Case, async: true
  alias Shippo.Operation
  alias Shippo.Operation.Rate

  describe "get/1" do
    test "returns a Operations struct with :get and /rates/:id" do
      assert %Operation{
               http_method: :get,
               path: "/rates/123",
               data: nil,
               opts: []
             } = Rate.get("123")
    end
  end
end
