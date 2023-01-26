defmodule SlacloneWeb.RoomLive.Index do
  use SlacloneWeb, :live_view

  alias Slaclone.Channel
  alias Slaclone.Channel.Room

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :rooms, list_rooms())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Room")
    |> assign(:room, Channel.get_room!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Room")
    |> assign(:room, %Room{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Rooms")
    |> assign(:room, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    room = Channel.get_room!(id)
    {:ok, _} = Channel.delete_room(room)

    {:noreply, assign(socket, :rooms, list_rooms())}
  end

  defp list_rooms do
    Channel.list_rooms()
  end
end
