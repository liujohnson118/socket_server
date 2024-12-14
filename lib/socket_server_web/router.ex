defmodule SocketServerWeb.Router do
  use SocketServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug,
      schema: SocketServerWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      interface: :playground,
      schema: SocketServerWeb.Schema,
      socket: SocketServerWeb.UserSocket
  end
end
