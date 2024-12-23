defmodule LearnPhoenix.Repo.Migrations.CreateStorageTypes do
  use Ecto.Migration

  def change do
    create table(:storage_types, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:storage_types, [:name])
  end
end
