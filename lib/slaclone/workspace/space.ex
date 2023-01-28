defmodule Slaclone.Workspace.Space do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workspace" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(space, attrs) do
    space
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
