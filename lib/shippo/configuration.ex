defmodule Shippo.Configuration do
  @type t :: %__MODULE__{
          url: nil | binary(),
          token: nil | binary(),
          client: nil | module(),
          client_opts: nil | keyword(),
          json_library: nil | module()
        }

  defstruct url: "https://api.goshippo.com",
            token: "",
            client: Shippo.Client.Hackney,
            client_opts: [],
            json_library: Jason

  @doc """
  Returns a new `Configuration` struct with overrides applied.
  """
  @spec new(overrides :: keyword()) :: t()
  def new(overrides \\ []) do
    fields =
      :shippo
      |> Application.get_all_env()
      |> Keyword.merge(overrides)

    struct(__MODULE__, fields)
  end
end
