defmodule LearnPhoenixWeb.StorageTypeLive.Form do
  use LearnPhoenixWeb, :live_view

  alias LearnPhoenix.AcstorTestCoverage
  alias LearnPhoenix.AcstorTestCoverage.StorageType

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Storage Type")
    |> assign(:storage_type, AcstorTestCoverage.get_storage_type!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Storage Type")
    |> assign(:storage_type, %StorageType{})
  end

  @impl true
  def handle_event("validate", %{"storage_type" => storage_type_params}, socket) do
    changeset =
      socket.assigns.storage_type
      |> AcstorTestCoverage.change_storage_type(storage_type_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"storage_type" => storage_type_params}, socket) do
    save_storage_type(socket, socket.assigns.live_action, storage_type_params)
  end

  defp save_storage_type(socket, :edit, storage_type_params) do
    case AcstorTestCoverage.update_storage_type(socket.assigns.storage_type, storage_type_params) do
      {:ok, _storage_type} ->
        {:noreply,
         socket
         |> put_flash(:info, "Storage type updated successfully")
         |> push_navigate(to: Routes.storage_type_index_path(socket, :index))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_storage_type(socket, :new, storage_type_params) do
    case AcstorTestCoverage.create_storage_type(storage_type_params) do
      {:ok, _storage_type} ->
        {:noreply,
         socket
         |> put_flash(:info, "Storage type created successfully")
         |> push_navigate(to: Routes.storage_type_index_path(socket, :index))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
