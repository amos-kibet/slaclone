defmodule SlacloneWeb.Router do
  alias SlacloneWeb.UserLive
  use SlacloneWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SlacloneWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SlacloneWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/workspace", SpaceLive.Index, :index

    live "/room", RoomLive.Index, :index
    live "/room/:id/edit", RoomLive.Index, :edit
    live "/room/new", RoomLive.Index, :new

    live "/user", UserLive.Index, :index
    live "/user/:id/edit", UserLive.Index, :edit
    live "/user/new", UserLive.Index, :new
  end

  # Other scopes may use custom stacks.
  # scope "/api", SlacloneWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:slaclone, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: SlacloneWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
