defmodule LearnPhoenixWeb.ListStorageTypes do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <h1>
      Current Storage Types are:
      <%= for storage_type <- @storage_types do %>
        <%= storage_type %>
      <% end %>
    </h1>
    """
  end
end
