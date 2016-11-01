defmodule Plugs.Authentication do
  def init(opts \\ []) do
    opts
  end

  def call(conn, _opts) do
    case get_user(Plug.Conn.get_session(conn, :current_user)) do
      nil ->
        conn
        |> Plug.Conn.put_status(401)
        |> Phoenix.Controller.render(PhoenixDemo.ErrorView, "401.html")
        |> Plug.Conn.halt

      user ->
        conn
        |> Plug.Conn.assign(:current_user, user)
    end
  end

  defp get_user(nil), do: nil
  defp get_user(id) do
    PhoenixDemo.Repo.get(PhoenixDemo.User, id)
  end
end
