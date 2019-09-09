defmodule RsvpWeb.EventResponseController do
  use RsvpWeb, :controller

  alias Rsvp.EventResponses
  alias Rsvp.EventResponses.EventResponse

  def index(conn, _params) do
    event_responses = EventResponses.list_event_responses()
    render(conn, "index.html", event_responses: event_responses)
  end

  def new(conn, _params) do
    changeset = EventResponses.change_event_response(%EventResponse{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"event_response" => event_response_params}) do
    case EventResponses.create_event_response(event_response_params) do
      {:ok, event_response} ->
        conn
        |> put_flash(:info, "Event response created successfully.")
        |> redirect(to: Routes.event_response_path(conn, :show, event_response))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    event_response = EventResponses.get_event_response!(id)
    render(conn, "show.html", event_response: event_response)
  end

  def edit(conn, %{"id" => id}) do
    event_response = EventResponses.get_event_response!(id)
    changeset = EventResponses.change_event_response(event_response)
    render(conn, "edit.html", event_response: event_response, changeset: changeset)
  end

  def update(conn, %{"id" => id, "event_response" => event_response_params}) do
    event_response = EventResponses.get_event_response!(id)

    case EventResponses.update_event_response(event_response, event_response_params) do
      {:ok, event_response} ->
        conn
        |> put_flash(:info, "Event response updated successfully.")
        |> redirect(to: Routes.event_response_path(conn, :show, event_response))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", event_response: event_response, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    event_response = EventResponses.get_event_response!(id)
    {:ok, _event_response} = EventResponses.delete_event_response(event_response)

    conn
    |> put_flash(:info, "Event response deleted successfully.")
    |> redirect(to: Routes.event_response_path(conn, :index))
  end
end
