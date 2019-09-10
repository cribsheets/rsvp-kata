defmodule Rsvp.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string
      add :date, :naive_datetime

      timestamps()
    end

  end
end
