defmodule LearnPhoenix.Storage.StorageType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "storage_types" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(storage_type, attrs) do
    storage_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
