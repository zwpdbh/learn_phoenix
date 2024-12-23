defmodule LearnPhoenix.StorageContext do
  @moduledoc """
  The Storage context.
  """

  import Ecto.Query, warn: false
  alias LearnPhoenix.Repo

  alias LearnPhoenix.Storage.StorageType
  alias LearnPhoenix.Storage.TestFeature

  def list_test_features do
    Repo.all(TestFeature)
  end

  def get_test_feature!(id) do
    Repo.get!(TestFeature, id)
  end

  def create_test_feature(attrs \\ %{}) do
    %TestFeature{}
    |> TestFeature.changeset(attrs)
    |> Repo.insert()
  end

  def update_test_feature(%TestFeature{} = test_feature, attrs) do
    test_feature
    |> TestFeature.changeset(attrs)
    |> Repo.update()
  end

  def delete_test_feature(%TestFeature{} = test_feature) do
    Repo.delete(test_feature)
  end

  def change_test_feature(%TestFeature{} = test_feature, attrs \\ %{}) do
    TestFeature.changeset(test_feature, attrs)
  end

  @doc """
  Returns the list of storage_types.

  ## Examples

      iex> list_storage_types()
      [%StorageType{}, ...]

  """
  def list_storage_types do
    Repo.all(StorageType)
  end

  @doc """
  Gets a single storage_type.

  Raises `Ecto.NoResultsError` if the Storage type does not exist.

  ## Examples

      iex> get_storage_type!(123)
      %StorageType{}

      iex> get_storage_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_storage_type!(id), do: Repo.get!(StorageType, id)

  @doc """
  Creates a storage_type.

  ## Examples

      iex> create_storage_type(%{field: value})
      {:ok, %StorageType{}}

      iex> create_storage_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_storage_type(attrs \\ %{}) do
    %StorageType{}
    |> StorageType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a storage_type.

  ## Examples

      iex> update_storage_type(storage_type, %{field: new_value})
      {:ok, %StorageType{}}

      iex> update_storage_type(storage_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_storage_type(%StorageType{} = storage_type, attrs) do
    storage_type
    |> StorageType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a storage_type.

  ## Examples

      iex> delete_storage_type(storage_type)
      {:ok, %StorageType{}}

      iex> delete_storage_type(storage_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_storage_type(%StorageType{} = storage_type) do
    Repo.delete(storage_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking storage_type changes.

  ## Examples

      iex> change_storage_type(storage_type)
      %Ecto.Changeset{data: %StorageType{}}

  """
  def change_storage_type(%StorageType{} = storage_type, attrs \\ %{}) do
    StorageType.changeset(storage_type, attrs)
  end
end
