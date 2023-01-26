defmodule Slaclone.WorkspaceTest do
  use Slaclone.DataCase

  alias Slaclone.Workspace

  describe "workspace" do
    alias Slaclone.Workspace.Space

    import Slaclone.WorkspaceFixtures

    @invalid_attrs %{name: nil}

    test "list_workspace/0 returns all workspace" do
      space = space_fixture()
      assert Workspace.list_workspace() == [space]
    end

    test "get_space!/1 returns the space with given id" do
      space = space_fixture()
      assert Workspace.get_space!(space.id) == space
    end

    test "create_space/1 with valid data creates a space" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Space{} = space} = Workspace.create_space(valid_attrs)
      assert space.name == "some name"
    end

    test "create_space/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workspace.create_space(@invalid_attrs)
    end

    test "update_space/2 with valid data updates the space" do
      space = space_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Space{} = space} = Workspace.update_space(space, update_attrs)
      assert space.name == "some updated name"
    end

    test "update_space/2 with invalid data returns error changeset" do
      space = space_fixture()
      assert {:error, %Ecto.Changeset{}} = Workspace.update_space(space, @invalid_attrs)
      assert space == Workspace.get_space!(space.id)
    end

    test "delete_space/1 deletes the space" do
      space = space_fixture()
      assert {:ok, %Space{}} = Workspace.delete_space(space)
      assert_raise Ecto.NoResultsError, fn -> Workspace.get_space!(space.id) end
    end

    test "change_space/1 returns a space changeset" do
      space = space_fixture()
      assert %Ecto.Changeset{} = Workspace.change_space(space)
    end
  end
end
