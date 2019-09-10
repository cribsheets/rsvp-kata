defmodule RsvpWeb.EventController do
  use RsvpWeb, :controller

  alias Rsvp.Events
  alias Rsvp.Events.Event

  alias Rsvp.EventResponses
  alias Rsvp.EventResponses.EventResponse

  def index(conn, _params) do
    events = Events.list_events()
    render(conn, "index.html", events: events)
  end

  def new(conn, _params) do
    changeset = Events.change_event(%Event{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"event" => event_params}) do
    case Events.create_event(event_params) do
      {:ok, event} ->
        conn
        |> put_flash(:info, "Event created successfully.")
        |> redirect(to: Routes.event_path(conn, :show, event))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    event = Events.get_event!(id)
    changeset = EventResponses.change_event_response(%EventResponse{})
    render(conn, "show.html", event: event, changeset: changeset)
  end

  def responses(conn, %{"id" => id}) do
    event = Events.get_event!(id)
    event_responses = EventResponses.list_event_responses_for_event(id)
    render(conn, "responses.html", event: event, event_responses: event_responses)
  end

  def edit(conn, %{"id" => id}) do
    event = Events.get_event!(id)
    changeset = Events.change_event(event)
    render(conn, "edit.html", event: event, changeset: changeset)
  end

  def update(conn, %{"id" => id, "event" => event_params}) do
    event = Events.get_event!(id)

    case Events.update_event(event, event_params) do
      {:ok, event} ->
        conn
        |> put_flash(:info, "Event updated successfully.")
        |> redirect(to: Routes.event_path(conn, :show, event))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", event: event, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    event = Events.get_event!(id)
    {:ok, _event} = Events.delete_event(event)

    conn
    |> put_flash(:info, "Event deleted successfully.")
    |> redirect(to: Routes.event_path(conn, :index))
  end
end
