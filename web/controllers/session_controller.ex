defmodule PhoenixDemo.SessionController do
  use PhoenixDemo.Web, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, params) do
    user = Repo.get_by(PhoenixDemo.User, email: params["user"]["email"])
    case authenticate(user, params["user"]["password_hash"]) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> redirect(to: "/")

      _ ->
        conn
        |> put_flash(:error, "invalid email or password")
        |> render("new.html")
    end
  end

  defp authenticate(nil, _), do: {:error, :no_user}
  defp authenticate(user, password_hash) do
    if user.password_hash == password_hash do
      {:ok, user}
    else
      {:error, :invalid_password}
    end
  end
end
