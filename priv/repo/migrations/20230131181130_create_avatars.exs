defmodule Slaclone.Repo.Migrations.CreateAvatars do
  use Ecto.Migration

  def change do
    create table(:avatars) do
      add :avatar, :string

      timestamps()
    end
  end
end
