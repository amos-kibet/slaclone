defmodule Slaclone.Avatar do
  use Ecto.Schema
  import Ecto.Changeset

  schema "avatars" do
    field :avatar, :string

    timestamps()
  end

  @doc false
  def changeset(avatar, attrs) do
    avatar
    |> cast(attrs, [:avatar])
    |> validate_required([:avatar])
  end
end
