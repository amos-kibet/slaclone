defmodule Slaclone.WorkspaceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Slaclone.Workspace` context.
  """

  @doc """
  Generate a space.
  """
  def space_fixture(attrs \\ %{}) do
    {:ok, space} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Slaclone.Workspace.create_space()

    space
  end
end
