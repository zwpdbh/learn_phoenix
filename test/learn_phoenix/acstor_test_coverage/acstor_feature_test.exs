defmodule LearnPhoenix.AcstorTestCoverage.AcstorFeatureTest do
  use LearnPhoenix.DataCase

  alias LearnPhoenix.AcstorTestCoverage

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
