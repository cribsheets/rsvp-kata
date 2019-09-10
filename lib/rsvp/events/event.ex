defmodule Rsvp.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :date, :naive_datetime
    field :title, :string

    has_many :event_responses, Rsvp.EventResponses.EventResponse

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :date])
    |> validate_required([:title, :date])
  end
end
