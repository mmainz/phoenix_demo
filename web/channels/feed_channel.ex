defmodule PhoenixDemo.FeedChannel do
  use PhoenixDemo.Web, :channel

  def join("feed:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
