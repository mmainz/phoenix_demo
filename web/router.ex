defmodule PhoenixDemo.Router do
  use PhoenixDemo.Web, :router

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

  scope "/", PhoenixDemo do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/posts", PostController

    get "/signup", UserController, :new
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :destroy
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixDemo do
  #   pipe_through :api
  # end
end
