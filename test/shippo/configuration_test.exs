defmodule Shippo.ConfigurationTest do
  use ExUnit.Case, async: true
  alias Shippo.ConfigHelpers
  alias Shippo.Configuration

  setup do
    ConfigHelpers.put_envs(token: "token")
  end

  describe "new/0" do
    test "returns a Configuration struct" do
      assert %Configuration{
               url: "https://api.goshippo.com",
               token: "token",
               client: Shippo.Client.Hackney,
               client_opts: [],
               json_library: Jason
             } = Configuration.new()
    end
  end

  describe "new/1" do
    test "returns a Configuration struct with overrides applied" do
      assert %Configuration{
               url: "https://example.com",
               token: "token",
               client: Shippo.Client.Hackney,
               client_opts: [],
               json_library: Jason
             } = Configuration.new(url: "https://example.com")
    end
  end
end
