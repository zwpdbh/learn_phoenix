defmodule LearnPhoenixWeb.TaskControllerTest do
  use LearnPhoenixWeb.ConnCase, async: true
  @moduletag :task_case

  # alias LearnPhoenix.TaskContext

  # @valid_attrs %{title: "Test task"}
  # @invalid_attrs %{title: nil}

  # describe "POST /tasks" do
  #   test "creates a task with valid data", %{conn: conn} do
  #     conn = post(conn, Routes.task_path(conn, :create), task: @valid_attrs)
  #     assert %{"id" => id} = json_response(conn, 201)
  #     assert TaskContext.get_task!(id).title == "Test task"
  #   end

  #   test "returns errors when data is invalid", %{conn: conn} do
  #     conn = post(conn, Routes.task_path(conn, :create), task: @invalid_attrs)
  #     assert json_response(conn, 422)["error"] != nil
  #   end
  # end

  # describe "GET /tasks/:id" do
  #   test "shows a task", %{conn: conn} do
  #     {:ok, task} = TaskContext.create_task(@valid_attrs)
  #     conn = get(conn, Routes.task_path(conn, :show, task.id))
  #     assert json_response(conn, 200)["title"] == task.title
  #   end

  #   test "returns 404 when task is not found", %{conn: conn} do
  #     conn = get(conn, Routes.task_path(conn, :show, 999))
  #     assert json_response(conn, 404)
  #   end
  # end

  # describe "GET /tasks" do
  #   test "lists all tasks", %{conn: conn} do
  #     {:ok, _task} = TaskContext.create_task(@valid_attrs)
  #     conn = get(conn, Routes.task_path(conn, :index))
  #     assert length(json_response(conn, 200)) == 1
  #   end
  # end

  # describe "DELETE /tasks/:id" do
  #   test "deletes a task", %{conn: conn} do
  #     {:ok, task} = TaskContext.create_task(@valid_attrs)
  #     conn = delete(conn, Routes.task_path(conn, :delete, task.id))
  #     assert response(conn, 204)
  #     assert_raise Ecto.NoResultsError, fn -> TaskContext.get_task!(task.id) end
  #   end
  # end
end
