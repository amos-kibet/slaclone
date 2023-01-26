defmodule Slaclone.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:username, :email, :password]
  @roles ["admin", "user"]

  schema "users" do
    field :email, :string
    field :password, :string
    field :role, :string, default: "user"
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :role])
    |> validate_required(@required_fields)
    |> unique_constraint([:username, :email])
  end
end
