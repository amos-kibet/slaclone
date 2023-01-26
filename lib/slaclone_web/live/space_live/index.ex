defmodule SlacloneWeb.SpaceLive.Index do
  use SlacloneWeb, :live_view

  alias Slaclone.Workspace
  alias Slaclone.Workspace.Space

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :workspace, list_workspace())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Space")
    |> assign(:space, Workspace.get_space!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Space")
    |> assign(:space, %Space{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Workspace")
    |> assign(:space, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    space = Workspace.get_space!(id)
    {:ok, _} = Workspace.delete_space(space)

    {:noreply, assign(socket, :workspace, list_workspace())}
  end

  defp list_workspace do
    Workspace.list_workspace()
  end
end
