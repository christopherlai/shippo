defmodule Shippo.ConfigHelpers do
  @moduledoc """
  Configuration helpers for testing.
  """

  def put_envs(configs) do
    Application.put_all_env(shippo: configs)
  end

  def put_env(key, value) do
    Application.put_env(:shippo, key, value)
  end

  def delete_env(key) do
    Application.delete_env(:shippo, key)
  end
end
