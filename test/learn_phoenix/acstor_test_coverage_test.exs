defmodule LearnPhoenix.AcstorTestCoverageTest do
  use LearnPhoenix.DataCase

  alias LearnPhoenix.AcstorTestCoverage

  describe "storage_types" do
    alias LearnPhoenix.AcstorTestCoverage.StorageType

    import LearnPhoenix.AcstorTestCoverageFixtures

    @invalid_attrs %{name: nil}

    test "list_storage_types/0 returns all storage_types" do
      storage_type = storage_type_fixture()
      assert AcstorTestCoverage.list_storage_types() == [storage_type]
    end

    test "get_storage_type!/1 returns the storage_type with given id" do
      storage_type = storage_type_fixture()
      assert AcstorTestCoverage.get_storage_type!(storage_type.id) == storage_type
    end

    test "create_storage_type/1 with valid data creates a storage_type" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %StorageType{} = storage_type} =
               AcstorTestCoverage.create_storage_type(valid_attrs)

      assert storage_type.name == "some name"
    end

    test "create_storage_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AcstorTestCoverage.create_storage_type(@invalid_attrs)
    end

    test "update_storage_type/2 with valid data updates the storage_type" do
      storage_type = storage_type_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %StorageType{} = storage_type} =
               AcstorTestCoverage.update_storage_type(storage_type, update_attrs)

      assert storage_type.name == "some updated name"
    end

    test "update_storage_type/2 with invalid data returns error changeset" do
      storage_type = storage_type_fixture()

      assert {:error, %Ecto.Changeset{}} =
               AcstorTestCoverage.update_storage_type(storage_type, @invalid_attrs)

      assert storage_type == AcstorTestCoverage.get_storage_type!(storage_type.id)
    end

    test "delete_storage_type/1 deletes the storage_type" do
      storage_type = storage_type_fixture()
      assert {:ok, %StorageType{}} = AcstorTestCoverage.delete_storage_type(storage_type)

      assert_raise Ecto.NoResultsError, fn ->
        AcstorTestCoverage.get_storage_type!(storage_type.id)
      end
    end

    test "change_storage_type/1 returns a storage_type changeset" do
      storage_type = storage_type_fixture()
      assert %Ecto.Changeset{} = AcstorTestCoverage.change_storage_type(storage_type)
    end
  end

  describe "acstor_features" do
    alias LearnPhoenix.AcstorTestCoverage.AcstorFeature

    import LearnPhoenix.AcstorTestCoverageFixtures

    @invalid_attrs %{name: nil, description: nil}

    test "list_acstor_features/0 returns all acstor_features" do
      acstor_feature = acstor_feature_fixture()
      assert AcstorTestCoverage.list_acstor_features() == [acstor_feature]
    end

    test "get_acstor_feature!/1 returns the acstor_feature with given id" do
      acstor_feature = acstor_feature_fixture()
      assert AcstorTestCoverage.get_acstor_feature!(acstor_feature.id) == acstor_feature
    end

    test "create_acstor_feature/1 with valid data creates a acstor_feature" do
      valid_attrs = %{name: "some name", description: "some description"}

      assert {:ok, %AcstorFeature{} = acstor_feature} =
               AcstorTestCoverage.create_acstor_feature(valid_attrs)

      assert acstor_feature.name == "some name"
      assert acstor_feature.description == "some description"
    end

    test "create_acstor_feature/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               AcstorTestCoverage.create_acstor_feature(@invalid_attrs)
    end

    test "update_acstor_feature/2 with valid data updates the acstor_feature" do
      acstor_feature = acstor_feature_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description"}

      assert {:ok, %AcstorFeature{} = acstor_feature} =
               AcstorTestCoverage.update_acstor_feature(acstor_feature, update_attrs)

      assert acstor_feature.name == "some updated name"
      assert acstor_feature.description == "some updated description"
    end

    test "update_acstor_feature/2 with invalid data returns error changeset" do
      acstor_feature = acstor_feature_fixture()

      assert {:error, %Ecto.Changeset{}} =
               AcstorTestCoverage.update_acstor_feature(acstor_feature, @invalid_attrs)

      assert acstor_feature == AcstorTestCoverage.get_acstor_feature!(acstor_feature.id)
    end

    test "delete_acstor_feature/1 deletes the acstor_feature" do
      acstor_feature = acstor_feature_fixture()
      assert {:ok, %AcstorFeature{}} = AcstorTestCoverage.delete_acstor_feature(acstor_feature)

      assert_raise Ecto.NoResultsError, fn ->
        AcstorTestCoverage.get_acstor_feature!(acstor_feature.id)
      end
    end

    test "change_acstor_feature/1 returns a acstor_feature changeset" do
      acstor_feature = acstor_feature_fixture()
      assert %Ecto.Changeset{} = AcstorTestCoverage.change_acstor_feature(acstor_feature)
    end
  end
end
