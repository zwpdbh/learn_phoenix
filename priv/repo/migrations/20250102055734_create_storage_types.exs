defmodule LearnPhoenix.Repo.Migrations.CreateStorageTypes do
  use Ecto.Migration

  def change do
    create table(:storage_types) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:storage_types, [:name])
  end
end
