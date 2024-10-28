defmodule DesafioFullstackWeb.Router do
  use DesafioFullstackWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {DesafioFullstackWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DesafioFullstackWeb do
    pipe_through :browser

    live "/", SurpriseActivityLive

    live "/activities/surprise", SurpriseActivityLive

    live "/activity/:title", ActivityLive.Show, :show
  end

  if Application.compile_env(:desafio_fullstack, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: DesafioFullstackWeb.Telemetry
    end
  end
end
