defmodule LearnPhoenixWeb.TestFeatureHTML do
  use LearnPhoenixWeb, :html

  embed_templates "test_feature_html/*"

  @doc """
  Renders a test_feature form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :storage_types, :list, required: true
  def test_feature_form(assigns)
end
