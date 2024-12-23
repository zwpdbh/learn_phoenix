defmodule LearnPhoenix.TestManagementFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LearnPhoenix.TestManagement` context.
  """

  @doc """
  Generate a test_feature.
  """
  def test_feature_fixture(attrs \\ %{}) do
    {:ok, test_feature} =
      attrs
      |> Enum.into(%{
        name: "some name",
        storage_type: "some storage_type"
      })
      |> LearnPhoenix.TestManagement.create_test_feature()

    test_feature
  end
end
