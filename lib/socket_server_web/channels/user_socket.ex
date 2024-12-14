defmodule SocketServerWeb.UserSocket do
  use Phoenix.Socket
  use Absinthe.Phoenix.Socket, schema: SocketServerWeb.Schema

  channel "users", SocketServerWeb.UserChannel
  channel "chat:*", SocketServerWeb.UserChannel

  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
