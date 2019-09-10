defmodule Rsvp.Repo.Migrations.AddNotNullEventId do
  use Ecto.Migration

  def change do
    alter table(:event_responses) do
      modify :event_id, :id, null: false
    end
  end
end
