defmodule Slaclone.Channel.Room do
  use Ecto.Schema
  import Ecto.Changeset

  alias Slaclone.Accounts.User
  alias Slaclone.Workspace.Space

  schema "rooms" do
    field :description, :string
    field :name, :string

    belongs_to :workspace, Space
    many_to_many :users, User, join_through: "users_rooms"

    timestamps()
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:name, :description, :workspace_id])
    |> validate_required([:name, :description])
  end
end
