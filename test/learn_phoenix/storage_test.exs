defmodule LearnPhoenix.StorageTest do
  use LearnPhoenix.DataCase

  alias LearnPhoenix.Storage

  describe "storage_types" do
    alias LearnPhoenix.Storage.StorageType

    import LearnPhoenix.StorageFixtures

    @invalid_attrs %{id: nil, name: nil}

    test "list_storage_types/0 returns all storage_types" do
      storage_type = storage_type_fixture()
      assert Storage.list_storage_types() == [storage_type]
    end

    test "get_storage_type!/1 returns the storage_type with given id" do
      storage_type = storage_type_fixture()
      assert Storage.get_storage_type!(storage_type.id) == storage_type
    end

    test "create_storage_type/1 with valid data creates a storage_type" do
      valid_attrs = %{id: "7488a646-e31f-11e4-aace-600308960662", name: "some name"}

      assert {:ok, %StorageType{} = storage_type} = Storage.create_storage_type(valid_attrs)
      assert storage_type.id == "7488a646-e31f-11e4-aace-600308960662"
      assert storage_type.name == "some name"
    end

    test "create_storage_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Storage.create_storage_type(@invalid_attrs)
    end

    test "update_storage_type/2 with valid data updates the storage_type" do
      storage_type = storage_type_fixture()
      update_attrs = %{id: "7488a646-e31f-11e4-aace-600308960668", name: "some updated name"}

      assert {:ok, %StorageType{} = storage_type} = Storage.update_storage_type(storage_type, update_attrs)
      assert storage_type.id == "7488a646-e31f-11e4-aace-600308960668"
      assert storage_type.name == "some updated name"
    end

    test "update_storage_type/2 with invalid data returns error changeset" do
      storage_type = storage_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Storage.update_storage_type(storage_type, @invalid_attrs)
      assert storage_type == Storage.get_storage_type!(storage_type.id)
    end

    test "delete_storage_type/1 deletes the storage_type" do
      storage_type = storage_type_fixture()
      assert {:ok, %StorageType{}} = Storage.delete_storage_type(storage_type)
      assert_raise Ecto.NoResultsError, fn -> Storage.get_storage_type!(storage_type.id) end
    end

    test "change_storage_type/1 returns a storage_type changeset" do
      storage_type = storage_type_fixture()
      assert %Ecto.Changeset{} = Storage.change_storage_type(storage_type)
    end
  end
end
