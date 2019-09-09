defmodule RsvpWeb.EventResponseControllerTest do
  use RsvpWeb.ConnCase

  alias Rsvp.EventResponses

  @create_attrs %{email: "some email", going: true, name: "some name"}
  @update_attrs %{email: "some updated email", going: false, name: "some updated name"}
  @invalid_attrs %{email: nil, going: nil, name: nil}

  def fixture(:event_response) do
    {:ok, event_response} = EventResponses.create_event_response(@create_attrs)
    event_response
  end

  describe "index" do
    test "lists all event_responses", %{conn: conn} do
      conn = get(conn, Routes.event_response_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Event responses"
    end
  end

  describe "new event_response" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.event_response_path(conn, :new))
      assert html_response(conn, 200) =~ "New Event response"
    end
  end

  describe "create event_response" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.event_response_path(conn, :create), event_response: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.event_response_path(conn, :show, id)

      conn = get(conn, Routes.event_response_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Event response"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.event_response_path(conn, :create), event_response: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Event response"
    end
  end

  describe "edit event_response" do
    setup [:create_event_response]

    test "renders form for editing chosen event_response", %{conn: conn, event_response: event_response} do
      conn = get(conn, Routes.event_response_path(conn, :edit, event_response))
      assert html_response(conn, 200) =~ "Edit Event response"
    end
  end

  describe "update event_response" do
    setup [:create_event_response]

    test "redirects when data is valid", %{conn: conn, event_response: event_response} do
      conn = put(conn, Routes.event_response_path(conn, :update, event_response), event_response: @update_attrs)
      assert redirected_to(conn) == Routes.event_response_path(conn, :show, event_response)

      conn = get(conn, Routes.event_response_path(conn, :show, event_response))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, event_response: event_response} do
      conn = put(conn, Routes.event_response_path(conn, :update, event_response), event_response: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Event response"
    end
  end

  describe "delete event_response" do
    setup [:create_event_response]

    test "deletes chosen event_response", %{conn: conn, event_response: event_response} do
      conn = delete(conn, Routes.event_response_path(conn, :delete, event_response))
      assert redirected_to(conn) == Routes.event_response_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.event_response_path(conn, :show, event_response))
      end
    end
  end

  defp create_event_response(_) do
    event_response = fixture(:event_response)
    {:ok, event_response: event_response}
  end
end
