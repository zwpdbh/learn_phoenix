defmodule LearnPhoenix.Storage.TestFeature do
  use Ecto.Schema
  import Ecto.Changeset

  schema "test_features" do
    field :name, :string

    many_to_many :storage_types, LearnPhoenix.Storage.StorageType,
      join_through: "storage_types_test_features"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(test_feature, attrs) do
    test_feature
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
