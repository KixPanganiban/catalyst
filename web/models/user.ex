defmodule Catalyst.User do
  use Catalyst.Web, :model

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :encrypted_pw, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :name, :password])
    |> validate_required([:email, :name, :password])
    |> unique_constraint(:email)
    |> hash_password
  end

  defp hash_password(changeset) do
    password = get_field(changeset, :password)
    put_change(changeset, :encrypted_pw, Comeonin.Bcrypt.hashpwsalt(password))
  end
end
