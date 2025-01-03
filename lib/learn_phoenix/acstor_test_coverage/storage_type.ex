defmodule LearnPhoenix.AcstorTestCoverage.StorageType do
  use Ecto.Schema
  import Ecto.Changeset

  alias LearnPhoenix.AcstorTestCoverage.AcstorFeature
  alias LearnPhoenix.AcstorTestCoverage.AcstorFeatureStorageType

  schema "storage_types" do
    field :name, :string

    many_to_many :acstor_features, AcstorFeature, join_through: AcstorFeatureStorageType

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(storage_type, attrs) do
    storage_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
