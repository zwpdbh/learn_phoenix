defmodule LearnPhoenix.AcstorTestCoverageFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LearnPhoenix.AcstorTestCoverage` context.
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
      |> LearnPhoenix.AcstorTestCoverage.create_storage_type()

    storage_type
  end

  @doc """
  Generate a acstor_feature.
  """
  def acstor_feature_fixture(attrs \\ %{}) do
    {:ok, acstor_feature} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> LearnPhoenix.AcstorTestCoverage.create_acstor_feature()

    acstor_feature
  end
end
