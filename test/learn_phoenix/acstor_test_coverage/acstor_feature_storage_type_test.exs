defmodule LearnPhoenix.AcstorTestCoverage.AcstorFeatureStorageTypeTest do
  use LearnPhoenix.DataCase

  alias LearnPhoenix.AcstorTestCoverage.AcstorFeatureStorageType

  describe "changeset/2" do
    test "valid attributes" do
      attrs = %{acstor_feature_id: 1, storage_type_id: 1}
      changeset = AcstorFeatureStorageType.changeset(%AcstorFeatureStorageType{}, attrs)
      assert changeset.valid?
    end

    test "invalid attributes" do
      attrs = %{}
      changeset = AcstorFeatureStorageType.changeset(%AcstorFeatureStorageType{}, attrs)
      refute changeset.valid?
    end

    test "required fields" do
      attrs = %{}
      changeset = AcstorFeatureStorageType.changeset(%AcstorFeatureStorageType{}, attrs)
      assert "can't be blank" in errors_on(changeset).acstor_feature_id
      assert "can't be blank" in errors_on(changeset).storage_type_id
    end
  end
end
