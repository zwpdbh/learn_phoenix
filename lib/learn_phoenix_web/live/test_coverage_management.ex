defmodule LearnPhoenixWeb.TestCoverageManagement do
  use LearnPhoenixWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :storage_types, LearnPhoenix.AcstorTestCoverage.list_storage_types())}
  end
end
