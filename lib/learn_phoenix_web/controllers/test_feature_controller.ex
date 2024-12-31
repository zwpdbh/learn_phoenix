defmodule LearnPhoenixWeb.TestFeatureController do
  use LearnPhoenixWeb, :controller

  alias LearnPhoenix.StorageContext
  alias LearnPhoenix.Storage.TestFeature

  def index(conn, _params) do
    test_features = StorageContext.list_test_features()
    render(conn, :index, test_features: test_features)
  end

  # def new(conn, _params) do
  #   changeset = StorageContext.change_test_feature(%TestFeature{})
  #   render(conn, :new, changeset: changeset)
  # end

  def new(conn, _params) do
    changeset = StorageContext.change_test_feature(%TestFeature{})
    storage_types = StorageContext.list_storage_types()

    IO.puts("->> Rendering new.html with storage_types: #{inspect(storage_types)}")

    render(conn, :new,
      changeset: changeset,
      storage_types: storage_types
    )
  end

  def create(conn, %{"test_feature" => test_feature_params}) do
    case StorageContext.create_test_feature(test_feature_params) do
      {:ok, test_feature} ->
        conn
        |> put_flash(:info, "Test feature created successfully.")
        |> redirect(to: ~p"/test_features/#{test_feature}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    test_feature = StorageContext.get_test_feature!(id)
    render(conn, :show, test_feature: test_feature)
  end

  def edit(conn, %{"id" => id}) do
    test_feature = StorageContext.get_test_feature!(id)
    storage_types = StorageContext.list_storage_types()
    changeset = StorageContext.change_test_feature(test_feature)

    render(conn, :edit,
      test_feature: test_feature,
      changeset: changeset,
      storage_types: storage_types
    )
  end

  def update(conn, %{"id" => id, "test_feature" => test_feature_params}) do
    test_feature = StorageContext.get_test_feature!(id)

    case StorageContext.update_test_feature(test_feature, test_feature_params) do
      {:ok, test_feature} ->
        conn
        |> put_flash(:info, "Test feature updated successfully.")
        |> redirect(to: ~p"/test_features/#{test_feature}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, test_feature: test_feature, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    test_feature = StorageContext.get_test_feature!(id)
    {:ok, _test_feature} = StorageContext.delete_test_feature(test_feature)

    conn
    |> put_flash(:info, "Test feature deleted successfully.")
    |> redirect(to: ~p"/test_features")
  end
end
