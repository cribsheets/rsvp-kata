defmodule RsvpWeb.Router do
  use RsvpWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RsvpWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/events", EventController
    resources "/event_responses", EventResponseController

    get "/events/:id/responses", EventController, :responses
  end

  # Other scopes may use custom stacks.
  # scope "/api", RsvpWeb do
  #   pipe_through :api
  # end
end
