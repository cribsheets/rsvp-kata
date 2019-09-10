defmodule Rsvp.EventResponses.EventResponse do
  use Ecto.Schema
  import Ecto.Changeset

  schema "event_responses" do
    field :email, :string
    field :going, :boolean, default: false
    field :name, :string

    belongs_to :events, Rsvp.Events.Event, foreign_key: :event_id

    timestamps()
  end

  @doc false
  def changeset(event_response, attrs) do
    event_response
    |> cast(attrs, [:name, :email, :going, :event_id])
    |> validate_required([:name, :email, :going, :event_id])
  end
end
