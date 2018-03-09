defmodule Database.User do
  use Ecto.Schema

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :username, :string
    field :external_id, :string
    field :external_provider, :string, default: "telegram"
    timestamps()
  end
end
