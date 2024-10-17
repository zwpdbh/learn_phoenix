# 3) Expose the Operations via a Controller
# a controller would handle the web requests and route them to the appropriate context function.

defmodule LearnPhoenixWeb.TaskController do
  use LearnPhoenixWeb, :controller

  alias LearnPhoenix.TaskContext

  def create(conn, %{"task" => task_params}) do
    case TaskContext.create_task(task_params) do
      {:ok, task} ->
        json(conn, %{id: task.id})

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{error: changeset.errors})
    end
  end

  # as get
  def show(conn, %{"id" => id}) do
    task = TaskContext.get_task!(id)
    json(conn, task)
  end

  # as list
  def index(conn, _params) do
    tasks = TaskContext.list_tasks()
    json(conn, tasks)
  end

  def delete(conn, %{"id" => id}) do
    case TaskContext.delete_task(id) do
      {:ok, _task} ->
        send_resp(conn, :no_content, "")

      {:error, _reason} ->
        send_resp(conn, :not_found, "")
    end
  end
end
