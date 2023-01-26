defmodule Slaclone.ChannelFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Slaclone.Channel` context.
  """

  @doc """
  Generate a room.
  """
  def room_fixture(attrs \\ %{}) do
    {:ok, room} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> Slaclone.Channel.create_room()

    room
  end
end
