defmodule Rsvp.Repo.Migrations.CreateEventResponses do
  use Ecto.Migration

  def change do
    create table(:event_responses) do
      add :name, :string
      add :email, :string
      add :going, :boolean, default: false, null: false
      add :event_id, references(:events, on_delete: :nothing)

      timestamps()
    end

    create index(:event_responses, [:event_id])
  end
end
