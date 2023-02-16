defmodule Slaclone.Avatar do
  alias Slaclone.Accounts.User
  use Ecto.Schema
  import Ecto.Changeset

  alias Slaclone.Accounts.User
  alias Slaclone.Workspace.Space

  schema "avatars" do
    field :avatar, :string

    belongs_to :users, User
    belongs_to :workspace, Space

    timestamps()
  end

  @doc false
  def changeset(avatar, attrs) do
    avatar
    |> cast(attrs, [:avatar, :users_id, :workspace_id])
  end
end
