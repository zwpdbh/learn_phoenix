defmodule LearnPhoenix.AcstorTestCoverage.AcstorFeature do
  use Ecto.Schema
  import Ecto.Changeset

  alias LearnPhoenix.AcstorTestCoverage.AcstorFeatureStorageType
  alias LearnPhoenix.AcstorTestCoverage.StorageType

  schema "acstor_features" do
    field :name, :string
    field :description, :string

    many_to_many :storage_types, StorageType, join_through: AcstorFeatureStorageType

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(acstor_feature, attrs) do
    acstor_feature
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
    |> validate_length(:description, min: 5)
  end
end
