defmodule SocketServerWeb.ChatChannel do
  use SocketServerWeb, :channel

  def join("chat_room:" <> id, payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "user is not authorized"}}
    end
  end

  def handle_in("send_message", %{"message" => message}, socket) do
    broadcast socket, "send_message", %{"message" => message}
    {:noreplay, socket}
  end

  defp authorized?(%{"user_id" => _}), do: true
  defp authorized?(_), do: false
end
