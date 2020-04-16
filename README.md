# Shippo
Light wrapper around the Shippo[API](https://goshippo.com/docs/intro/).

[https://hexdocs.pm/shippo](https://hexdocs.pm/shippo)

## Installation
The package can be installed by adding `shippo` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:shippo, "~> 0.1.0"},
  {:hackney, "~> 1.15"}
  {:jason, "~> 1.2"}
  ]
end
```

## Configuration
`Shippo` can be configured in `config.exs`. The only configuration required is the Shippo token.

```elixir
config :shippo,
  token: "<shippo-token>"
```

Other options include:
* `url`
* `client`
* `client_opts`
* `json_library`

`Shippo.Client.Hackney` is the default HTTP client and `jason` is the default JSON library. Both are optional and can be replaced with your package of choice.

If you’d like to use a different HTTP client, simply create a module that uses the `Shippo.Client` behaviour, and set your `client` configuration to the module.

```elixir
# shippo_client.ex

defmodule MyApp.ShippoClient do
  @behaviour Shippo.Client

  @impl true
  def request(method, url, headers, body, opts) do
  # your code here
  end
end


# config.exs

config :shippo,
  token: "<shippo-token>",
  client: MyApp.ShippoClient
```

## Usage
This package is a simple and lightweight wrapper around the Shippo API. API requests are made by constructing a `Operation` struct and then passing the operation to `Shippo.request/1`.

In the example below, `Shippo.Operation.Address.create/1` returns an `Operation` struct; this function does not produce network side effects. The `Operation` is executed by passing it to `Shippo.request/1`, this produces the network side effect and makes a HTTP call to the Shippo API.

```elixir
params = %{
  name: "Kris Shippo",
  street1: "123 Address",
  ctiy: "City",
  state: "CA",
  zip: "92000",
  country: "US"
}

params
|> Shippo.Operation.Address.create()
|> Shippo.request()
# {:ok, %{...}}
```

### Filtering
The Shippo API supports [filtering](https://goshippo.com/docs/filtering/) through query parameters. This functionality is support by passing a keyword list to function calls.

```elixir
operation = Shippo.Operation.Address.list(results: 1, object_created_gt: "2020-01-01")

Shippo.request(operation) # {:ok, %{...}}
```

### Pagination
Listing resources is paginated (a default of 5 objects are returned per the Shippo API documentation). If paginated, the response body will return a URL in the `next` and `previous` fields. These fields can be passed directly to `Shippo.request/1` to request the next or previous set of resources.

```elixir
operation = Shippo.Operation.Address.list(results: 1, object_created_gt: "2020-01-01")

{:ok, response} = Shippo.request(operation)
{:ok, response} = Shippo.request(response["next"])
{:ok, response} = Shippo.request(response["previous"])
```

## Testing
A combination of `mox` and `behaviours` are used for testing.

```elixir
# test_helper.exs
ExUnit.start()
Mox.defmock(MyApp.ShippoClient, for: Shippo.Client)

# my_app_test.exs
defmodule MyAppTest do
  use ExUnit.Case
  import Mox
  setup :verify_on_exit!

  test "test usps" do
   expect(MyApp.ShippoClient, :request, fn _method, _url, _headers, _body, _opts ->
      {:ok, %{status_code: 200, headers: [], body:""}}
    end)

    assert {:ok, response} =
      "1234"
      |> Shippo.Operation.Address.get()
      |> Shippo.request()
  end
end

```

Please see [`mox`](#)(https://hexdocs.pm/mox/Mox.html) for more information.

## License
The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOF
