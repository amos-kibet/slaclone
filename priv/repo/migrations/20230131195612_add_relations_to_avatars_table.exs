defmodule Slaclone.Repo.Migrations.AddRelationsToAvatarsTable do
  use Ecto.Migration

  def change do
    alter table(:avatars) do
      add :user_id, references("users")
      add :workspace_id, references("workspace")
    end
  end
end
