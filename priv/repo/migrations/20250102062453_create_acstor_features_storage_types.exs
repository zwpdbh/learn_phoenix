defmodule LearnPhoenix.Repo.Migrations.CreateAcstorFeaturesStorageTypes do
  use Ecto.Migration

  def change do
    create table(:acstor_features_storage_types) do
      add :acstor_feature_id, references(:acstor_features, on_delete: :nothing), null: false
      add :storage_type_id, references(:storage_types, on_delete: :nothing), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:acstor_features_storage_types, [:acstor_feature_id])
    create index(:acstor_features_storage_types, [:storage_type_id])
    create unique_index(:acstor_features_storage_types, [:acstor_feature_id, :storage_type_id])
  end
end
