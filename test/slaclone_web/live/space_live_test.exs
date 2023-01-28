defmodule SlacloneWeb.SpaceLiveTest do
  use SlacloneWeb.ConnCase

  import Phoenix.LiveViewTest
  import Slaclone.WorkspaceFixtures
  import Slaclone.AccountsFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  setup %{conn: conn} do
    password = valid_user_password()
    user = user_fixture(%{password: password})
    %{conn: log_in_user(conn, user), user: user, password: password}
  end

  defp create_space(_) do
    space = space_fixture()
    %{space: space}
  end

  describe "Index" do
    setup [:create_space]

    test "lists all workspace", %{conn: conn, space: space} do
      {:ok, _index_live, html} = live(conn, ~p"/workspace")

      assert html =~ "Listing Workspace"
      assert html =~ space.name
    end

    test "saves new space", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/workspace")

      assert index_live |> element("a", "New Space") |> render_click() =~
               "New Space"

      assert_patch(index_live, ~p"/workspace/new")

      assert index_live
             |> form("#space-form", space: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#space-form", space: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/workspace")

      assert html =~ "Space created successfully"
      assert html =~ "some name"
    end

    test "updates space in listing", %{conn: conn, space: space} do
      {:ok, index_live, _html} = live(conn, ~p"/workspace")

      assert index_live |> element("#workspace-#{space.id} a", "Edit") |> render_click() =~
               "Edit Space"

      assert_patch(index_live, ~p"/workspace/#{space}/edit")

      assert index_live
             |> form("#space-form", space: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#space-form", space: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/workspace")

      assert html =~ "Space updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes space in listing", %{conn: conn, space: space} do
      {:ok, index_live, _html} = live(conn, ~p"/workspace")

      assert index_live |> element("#workspace-#{space.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#space-#{space.id}")
    end
  end

  describe "Show" do
    setup [:create_space]

    test "displays space", %{conn: conn, space: space} do
      {:ok, _show_live, html} = live(conn, ~p"/workspace/#{space}")

      assert html =~ "Show Space"
      assert html =~ space.name
    end

    test "updates space within modal", %{conn: conn, space: space} do
      {:ok, show_live, _html} = live(conn, ~p"/workspace/#{space}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Space"

      assert_patch(show_live, ~p"/workspace/#{space}/show/edit")

      assert show_live
             |> form("#space-form", space: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#space-form", space: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/workspace/#{space}")

      assert html =~ "Space updated successfully"
      assert html =~ "some updated name"
    end
  end
end
