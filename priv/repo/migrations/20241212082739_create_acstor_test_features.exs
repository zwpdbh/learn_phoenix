defmodule LearnPhoenix.Repo.Migrations.CreateAcstorTestFeatures do
  use Ecto.Migration

  def change do
    create table(:acstor_test_features, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :storage_type, :string, null: false

      timestamps()
    end

    create index(:acstor_test_features, [:name])
  end
end
