defmodule Slaclone.Repo.Migrations.CreateWorkspace do
  use Ecto.Migration

  def change do
    create table(:workspace) do
      add :name, :string

      timestamps()
    end
  end
end
