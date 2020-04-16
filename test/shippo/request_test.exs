defmodule Shippo.RequestTest do
  use ExUnit.Case, async: true

  alias Shippo.{
    ConfigHelpers,
    Configuration,
    Operation,
    Request
  }

  setup do
    configuration = Configuration.new()
    operation = Operation.new(:post, "/test", %{test: "foo"}, results: 1)
    ConfigHelpers.put_envs(token: "token")

    {:ok, configuration: configuration, operation: operation}
  end

  describe "url/2" do
    test "returns a URL binary based on the given configuration and operation", %{
      configuration: configuration,
      operation: operation
    } do
      assert "https://api.goshippo.com/test?results=1" = Request.url(configuration, operation)
    end
  end

  describe "headers/1" do
    test "returns a list of tuples based on the given configuration", %{
      configuration: configuration
    } do
      assert [{"authorization", "ShippoToken token"}, {"content-type", "application/json"}] =
               Request.headers(configuration)
    end
  end

  describe "body/2" do
    test "returns the body as JSON", %{configuration: configuration, operation: operation} do
      assert ~s({"test":"foo"}) = Request.body(configuration, operation)
    end

    test "returns an empty string when data is nil", %{
      configuration: configuration,
      operation: operation
    } do
      assert "" = Request.body(configuration, %{operation | data: nil})
    end

    test "returns an empty string when empty is given", %{
      configuration: configuration,
      operation: operation
    } do
      assert "" = Request.body(configuration, %{operation | data: ""})
    end
  end
end
