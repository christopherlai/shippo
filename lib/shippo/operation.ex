defmodule Shippo.Operation do
  @type t :: %__MODULE__{
          http_method: nil | atom(),
          path: nil | binary(),
          data: nil | term(),
          opts: nil | keyword()
        }

  defstruct http_method: :get,
            path: "/",
            data: "",
            opts: []

  @doc """
  Returns a `Operation` with the given arguments.
  """
  @spec new(method :: atom(), path :: binary(), data :: term()) :: t()
  def new(method, path, data \\ "", opts \\ []) do
    struct(__MODULE__, http_method: method, path: path, data: data, opts: opts)
  end
end
