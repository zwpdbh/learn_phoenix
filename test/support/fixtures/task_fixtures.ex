defmodule LearnPhoenix.TaskFixtures do
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> LearnPhoenix.TaskContext.create_task()

    task
  end
end
