defmodule Database.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table :users do
      add :first_name, :string
      add :last_name, :string
      add :username, :string
      add :external_id, :string
      add :external_provider, :string, default: "telegram"
      timestamps()
    end
  end
end
