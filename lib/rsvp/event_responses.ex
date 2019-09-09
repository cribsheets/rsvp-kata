defmodule Rsvp.EventResponses do
  @moduledoc """
  The EventResponses context.
  """

  import Ecto.Query, warn: false
  alias Rsvp.Repo

  alias Rsvp.EventResponses.EventResponse

  @doc """
  Returns the list of event_responses.

  ## Examples

      iex> list_event_responses()
      [%EventResponse{}, ...]

  """
  def list_event_responses do
    Repo.all(EventResponse)
  end

  @doc """
  Gets a single event_response.

  Raises `Ecto.NoResultsError` if the Event response does not exist.

  ## Examples

      iex> get_event_response!(123)
      %EventResponse{}

      iex> get_event_response!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event_response!(id), do: Repo.get!(EventResponse, id)

  @doc """
  Creates a event_response.

  ## Examples

      iex> create_event_response(%{field: value})
      {:ok, %EventResponse{}}

      iex> create_event_response(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event_response(attrs \\ %{}) do
    %EventResponse{}
    |> EventResponse.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a event_response.

  ## Examples

      iex> update_event_response(event_response, %{field: new_value})
      {:ok, %EventResponse{}}

      iex> update_event_response(event_response, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event_response(%EventResponse{} = event_response, attrs) do
    event_response
    |> EventResponse.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a EventResponse.

  ## Examples

      iex> delete_event_response(event_response)
      {:ok, %EventResponse{}}

      iex> delete_event_response(event_response)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event_response(%EventResponse{} = event_response) do
    Repo.delete(event_response)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event_response changes.

  ## Examples

      iex> change_event_response(event_response)
      %Ecto.Changeset{source: %EventResponse{}}

  """
  def change_event_response(%EventResponse{} = event_response) do
    EventResponse.changeset(event_response, %{})
  end
end
