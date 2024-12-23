defmodule LearnPhoenix.Repo.Migrations.CreateTestFeatures do
  use Ecto.Migration

  def change do
    create table(:test_features) do
      add :name, :string, null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:test_features, [:name])

    create table(:storage_types_test_features) do
      add :storage_type_id, references(:storage_types, on_delete: :delete_all), null: false
      add :test_feature_id, references(:test_features, on_delete: :delete_all), null: false

      timestamps()
    end

    create unique_index(:storage_types_test_features, [:storage_type_id, :test_feature_id])
  end
end
