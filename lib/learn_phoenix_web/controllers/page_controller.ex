defmodule LearnPhoenixWeb.PageController do
  use LearnPhoenixWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    # render(conn, :home, layout: true)
    render(conn, :home)
  end
end
