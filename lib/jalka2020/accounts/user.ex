defmodule Jalka2020.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name])
    |> validate_format(:name, ~r/^[a-zA-Z0-9_]*$/,
         message: "only letters, numbers, and underscores please"
       )
    |> validate_length(:name, max: 20)
    |> unique_constraint(:name)
  end
end
