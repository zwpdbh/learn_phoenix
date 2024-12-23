defmodule LearnPhoenix.StorageFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LearnPhoenix.Storage` context.
  """

  @doc """
  Generate a storage_type.
  """
  def storage_type_fixture(attrs \\ %{}) do
    {:ok, storage_type} =
      attrs
      |> Enum.into(%{
        id: "7488a646-e31f-11e4-aace-600308960662",
        name: "some name"
      })
      |> LearnPhoenix.Storage.create_storage_type()

    storage_type
  end
end
