defmodule LearnPhoenix.AcstorTestCoverage.AcstorFeatureStorageType do
  use Ecto.Schema
  import Ecto.Changeset

  alias LearnPhoenix.AcstorTestCoverage.AcstorFeature
  alias LearnPhoenix.AcstorTestCoverage.StorageType

  @primary_key false
  schema "acstor_features_storage_types" do
    belongs_to :acstor_feature, AcstorFeature
    belongs_to :storage_type, StorageType

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(acstor_feature_storage_type, attrs) do
    acstor_feature_storage_type
    |> cast(attrs, [:acstor_feature_id, :storage_type_id])
    |> validate_required([:acstor_feature_id, :storage_type_id])
  end
end
