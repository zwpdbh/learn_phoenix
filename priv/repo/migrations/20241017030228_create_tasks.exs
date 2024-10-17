defmodule LearnPhoenix.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string, null: false

      timestamps()
    end
  end
end
