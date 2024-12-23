defmodule LearnPhoenix.Repo.Migrations.CreateStorageTypes do
  use Ecto.Migration

  def change do
    create table(:storage_types) do
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:storage_types, [:name])
  end
end
