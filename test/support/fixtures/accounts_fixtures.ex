defmodule Slaclone.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Slaclone.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password: "some password",
        role: "some role",
        username: "some username"
      })
      |> Slaclone.Accounts.create_user()

    user
  end
end
