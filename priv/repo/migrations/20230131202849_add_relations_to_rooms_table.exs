defmodule Slaclone.Repo.Migrations.AddRelationsToRoomsTable do
  use Ecto.Migration

  def change do
    alter table(:rooms) do
      add :workspace_id, references("workspace")
    end
  end
end
