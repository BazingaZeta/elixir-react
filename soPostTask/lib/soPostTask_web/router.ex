defmodule SoPostTaskWeb.Router do
  use SoPostTaskWeb, :router

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

  scope "/", SoPostTaskWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api" do
    pipe_through :api

    get "/", Absinthe.Plug.GraphiQL, schema: SoPostTaskWeb.Api.Schema, interface: :playground
    post "/", Absinthe.Plug, schema: SoPostTaskWeb.Api.Schema
  end
end
