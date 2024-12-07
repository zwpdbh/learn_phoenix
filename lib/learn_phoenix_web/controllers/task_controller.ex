# 3) Expose the Operations via a Controller
# a controller would handle the web requests and route them to the appropriate context function.

defmodule LearnPhoenixWeb.TaskController do
  use LearnPhoenixWeb, :controller

  alias LearnPhoenix.TaskContext
  alias LearnPhoenix.Task

  action_fallback LearnPhoenixWeb.FallbackController

  # as list
  def index(conn, _params) do
    tasks = TaskContext.list_tasks()
    render(conn, :index, tasks: tasks)
  end

  def create(conn, %{"task" => task_params}) do
    with {:ok, %Task{} = task} <- TaskContext.create_task(task_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/tasks/#{task}")
      |> render(:show, task: task)
    end
  end

  # as get
  def show(conn, %{"id" => id}) do
    task = TaskContext.get_task!(id)
    render(conn, :show, task: task)
  end

  def delete(conn, %{"id" => id}) do
    task = TaskContext.get_task!(id)

    with {:ok, %Task{}} <- TaskContext.delete_task(task) do
      send_resp(conn, :no_content, "")
    end
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = TaskContext.get_task!(id)

    with {:ok, %Task{} = task} <- TaskContext.update_task(task, task_params) do
      render(conn, :show, task: task)
    end
  end
end
