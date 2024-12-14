defmodule SocketServerWeb.UserChannel do
  use SocketServerWeb, :channel

  def join("users", _payload, socket) do
    {:ok, socket}
  end

  def handle_in("new_user", %{"id" => id}, socket) do
    broadcast socket, "new_user", %{"id" => id}
    {:replay, %{"accepted" => true}, socket}
  end
end
