defmodule LearnPhoenix.TestManagement.TestFeature do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "acstor_test_features" do
    field :name, :string
    field :storage_type, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(test_feature, attrs) do
    test_feature
    |> cast(attrs, [:name, :storage_type])
    |> validate_required([:name, :storage_type])
  end
end
