defmodule Slaclone.Repo.Migrations.AddRelationsToUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :workspace_id, references("workspace")
    end
  end
end
