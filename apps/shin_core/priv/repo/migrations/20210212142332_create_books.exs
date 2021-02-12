defmodule ShinCore.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :name, :text
      add :href, :text

      timestamps(default: fragment("NOW()"))
    end
  end
end
