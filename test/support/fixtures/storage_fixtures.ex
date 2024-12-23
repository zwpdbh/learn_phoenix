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
        name: "Nvme"
      })
      |> LearnPhoenix.StorageContext.create_storage_type()

    storage_type
  end

  def test_feature_fixture(attrs \\ %{}) do
    {:ok, test_feature} =
      attrs
      |> Enum.into(%{
        name: "Cluster upgrade"
      })
      |> LearnPhoenix.StorageContext.create_test_feature()

    test_feature
  end
end
