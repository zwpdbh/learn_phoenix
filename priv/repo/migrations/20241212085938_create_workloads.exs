defmodule LearnPhoenix.Repo.Migrations.CreateWorkloads do
  use Ecto.Migration

  def change do
    create table(:workloads, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :description, :text

      add :feature, references(:acstor_test_features, type: :uuid, on_delete: :nothing),
        null: false

      timestamps()
    end

    create index(:workloads, [:name])
    create index(:workloads, [:feature])
  end
end
