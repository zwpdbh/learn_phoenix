defmodule LearnPhoenixWeb.TestFeatureControllerTest do
  use LearnPhoenixWeb.ConnCase

  import LearnPhoenix.TestFeaturesFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all test_features", %{conn: conn} do
      conn = get(conn, ~p"/test_features")
      assert html_response(conn, 200) =~ "Listing Test features"
    end
  end

  describe "new test_feature" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/test_features/new")
      assert html_response(conn, 200) =~ "New Test feature"
    end
  end

  describe "create test_feature" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/test_features", test_feature: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/test_features/#{id}"

      conn = get(conn, ~p"/test_features/#{id}")
      assert html_response(conn, 200) =~ "Test feature #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/test_features", test_feature: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Test feature"
    end
  end

  describe "edit test_feature" do
    setup [:create_test_feature]

    test "renders form for editing chosen test_feature", %{conn: conn, test_feature: test_feature} do
      conn = get(conn, ~p"/test_features/#{test_feature}/edit")
      assert html_response(conn, 200) =~ "Edit Test feature"
    end
  end

  describe "update test_feature" do
    setup [:create_test_feature]

    test "redirects when data is valid", %{conn: conn, test_feature: test_feature} do
      conn = put(conn, ~p"/test_features/#{test_feature}", test_feature: @update_attrs)
      assert redirected_to(conn) == ~p"/test_features/#{test_feature}"

      conn = get(conn, ~p"/test_features/#{test_feature}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, test_feature: test_feature} do
      conn = put(conn, ~p"/test_features/#{test_feature}", test_feature: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Test feature"
    end
  end

  describe "delete test_feature" do
    setup [:create_test_feature]

    test "deletes chosen test_feature", %{conn: conn, test_feature: test_feature} do
      conn = delete(conn, ~p"/test_features/#{test_feature}")
      assert redirected_to(conn) == ~p"/test_features"

      assert_error_sent 404, fn ->
        get(conn, ~p"/test_features/#{test_feature}")
      end
    end
  end

  defp create_test_feature(_) do
    test_feature = test_feature_fixture()
    %{test_feature: test_feature}
  end
end
