defmodule Rsvp.EventResponsesTest do
  use Rsvp.DataCase

  alias Rsvp.EventResponses

  describe "event_responses" do
    alias Rsvp.EventResponses.EventResponse

    @valid_attrs %{email: "some email", going: true, name: "some name"}
    @update_attrs %{email: "some updated email", going: false, name: "some updated name"}
    @invalid_attrs %{email: nil, going: nil, name: nil}

    def event_response_fixture(attrs \\ %{}) do
      {:ok, event_response} =
        attrs
        |> Enum.into(@valid_attrs)
        |> EventResponses.create_event_response()

      event_response
    end

    test "list_event_responses/0 returns all event_responses" do
      event_response = event_response_fixture()
      assert EventResponses.list_event_responses() == [event_response]
    end

    test "get_event_response!/1 returns the event_response with given id" do
      event_response = event_response_fixture()
      assert EventResponses.get_event_response!(event_response.id) == event_response
    end

    test "create_event_response/1 with valid data creates a event_response" do
      assert {:ok, %EventResponse{} = event_response} = EventResponses.create_event_response(@valid_attrs)
      assert event_response.email == "some email"
      assert event_response.going == true
      assert event_response.name == "some name"
    end

    test "create_event_response/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = EventResponses.create_event_response(@invalid_attrs)
    end

    test "update_event_response/2 with valid data updates the event_response" do
      event_response = event_response_fixture()
      assert {:ok, %EventResponse{} = event_response} = EventResponses.update_event_response(event_response, @update_attrs)
      assert event_response.email == "some updated email"
      assert event_response.going == false
      assert event_response.name == "some updated name"
    end

    test "update_event_response/2 with invalid data returns error changeset" do
      event_response = event_response_fixture()
      assert {:error, %Ecto.Changeset{}} = EventResponses.update_event_response(event_response, @invalid_attrs)
      assert event_response == EventResponses.get_event_response!(event_response.id)
    end

    test "delete_event_response/1 deletes the event_response" do
      event_response = event_response_fixture()
      assert {:ok, %EventResponse{}} = EventResponses.delete_event_response(event_response)
      assert_raise Ecto.NoResultsError, fn -> EventResponses.get_event_response!(event_response.id) end
    end

    test "change_event_response/1 returns a event_response changeset" do
      event_response = event_response_fixture()
      assert %Ecto.Changeset{} = EventResponses.change_event_response(event_response)
    end
  end
end
