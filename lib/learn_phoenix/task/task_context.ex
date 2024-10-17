# 2) Define a Context for Task Operations
# This is similar to your TaskBmc in Rust.
defmodule LearnPhoenix.TaskContext do
  alias LearnPhoenix.Repo
  alias LearnPhoenix.Task

  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  def get_task!(id), do: Repo.get!(Task, id)

  def list_tasks do
    Repo.all(Task)
  end

  def delete_task(id) do
    task = get_task!(id)
    Repo.delete(task)
  end
end
