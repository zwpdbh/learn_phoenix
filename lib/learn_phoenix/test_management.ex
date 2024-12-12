defmodule LearnPhoenix.TestManagement do
  @moduledoc """
  The TestManagement context.
  """

  import Ecto.Query, warn: false
  alias LearnPhoenix.Repo

  alias LearnPhoenix.TestManagement.TestFeature

  @doc """
  Returns the list of acstor_test_features.

  ## Examples

      iex> list_acstor_test_features()
      [%TestFeature{}, ...]

  """
  def list_acstor_test_features do
    Repo.all(TestFeature)
  end

  @doc """
  Gets a single test_feature.

  Raises `Ecto.NoResultsError` if the Test feature does not exist.

  ## Examples

      iex> get_test_feature!(123)
      %TestFeature{}

      iex> get_test_feature!(456)
      ** (Ecto.NoResultsError)

  """
  def get_test_feature!(id), do: Repo.get!(TestFeature, id)

  @doc """
  Creates a test_feature.

  ## Examples

      iex> create_test_feature(%{field: value})
      {:ok, %TestFeature{}}

      iex> create_test_feature(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_test_feature(attrs \\ %{}) do
    %TestFeature{}
    |> TestFeature.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a test_feature.

  ## Examples

      iex> update_test_feature(test_feature, %{field: new_value})
      {:ok, %TestFeature{}}

      iex> update_test_feature(test_feature, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_test_feature(%TestFeature{} = test_feature, attrs) do
    test_feature
    |> TestFeature.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a test_feature.

  ## Examples

      iex> delete_test_feature(test_feature)
      {:ok, %TestFeature{}}

      iex> delete_test_feature(test_feature)
      {:error, %Ecto.Changeset{}}

  """
  def delete_test_feature(%TestFeature{} = test_feature) do
    Repo.delete(test_feature)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking test_feature changes.

  ## Examples

      iex> change_test_feature(test_feature)
      %Ecto.Changeset{data: %TestFeature{}}

  """
  def change_test_feature(%TestFeature{} = test_feature, attrs \\ %{}) do
    TestFeature.changeset(test_feature, attrs)
  end
end
