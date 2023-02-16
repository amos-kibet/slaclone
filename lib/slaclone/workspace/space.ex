defmodule Slaclone.Workspace.Space do
  use Ecto.Schema
  import Ecto.Changeset

  alias Slaclone.Avatar
  alias Slaclone.Channel.Room
  alias Slaclone.Accounts.User

  schema "workspace" do
    field :name, :string

    has_many :users, User
    has_many :rooms, Room
    has_one :avatars, Avatar

    timestamps()
  end

  @doc false
  def changeset(space, attrs) do
    space
    |> cast(attrs, [:name, :users_id, :room_id, :avatars_id])
    |> validate_required([:name])
  end
end
