defmodule LearnPhoenix.TestManagementTest do
  use LearnPhoenix.DataCase

  alias LearnPhoenix.TestManagement

  describe "acstor_test_features" do
    alias LearnPhoenix.TestManagement.TestFeature

    import LearnPhoenix.TestManagementFixtures

    @invalid_attrs %{name: nil, storage_type: nil}

    test "list_acstor_test_features/0 returns all acstor_test_features" do
      test_feature = test_feature_fixture()
      assert TestManagement.list_acstor_test_features() == [test_feature]
    end

    test "get_test_feature!/1 returns the test_feature with given id" do
      test_feature = test_feature_fixture()
      assert TestManagement.get_test_feature!(test_feature.id) == test_feature
    end

    test "create_test_feature/1 with valid data creates a test_feature" do
      valid_attrs = %{name: "some name", storage_type: "some storage_type"}

      assert {:ok, %TestFeature{} = test_feature} =
               TestManagement.create_test_feature(valid_attrs)

      assert test_feature.name == "some name"
      assert test_feature.storage_type == "some storage_type"
    end

    test "create_test_feature/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TestManagement.create_test_feature(@invalid_attrs)
    end

    test "update_test_feature/2 with valid data updates the test_feature" do
      test_feature = test_feature_fixture()
      update_attrs = %{name: "some updated name", storage_type: "some updated storage_type"}

      assert {:ok, %TestFeature{} = test_feature} =
               TestManagement.update_test_feature(test_feature, update_attrs)

      assert test_feature.name == "some updated name"
      assert test_feature.storage_type == "some updated storage_type"
    end

    test "update_test_feature/2 with invalid data returns error changeset" do
      test_feature = test_feature_fixture()

      assert {:error, %Ecto.Changeset{}} =
               TestManagement.update_test_feature(test_feature, @invalid_attrs)

      assert test_feature == TestManagement.get_test_feature!(test_feature.id)
    end

    test "delete_test_feature/1 deletes the test_feature" do
      test_feature = test_feature_fixture()
      assert {:ok, %TestFeature{}} = TestManagement.delete_test_feature(test_feature)

      assert_raise Ecto.NoResultsError, fn ->
        TestManagement.get_test_feature!(test_feature.id)
      end
    end

    test "change_test_feature/1 returns a test_feature changeset" do
      test_feature = test_feature_fixture()
      assert %Ecto.Changeset{} = TestManagement.change_test_feature(test_feature)
    end
  end
end
