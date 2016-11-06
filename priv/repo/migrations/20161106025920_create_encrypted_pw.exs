defmodule Catalyst.Repo.Migrations.CreateEncryptedPw do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :encrypted_pw, :string
      remove :password
    end
  end
end
