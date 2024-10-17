# 1) Define a Schema for the Task
defmodule LearnPhoenix.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :title, :string
    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
