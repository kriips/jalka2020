defmodule Jalka2020Web.UserLive.New do
  use Phoenix.LiveView

  alias Jalka2020Web.UserLive
  alias Jalka2020Web.UserView
  alias Jalka2020Web.Router.Helpers, as: Routes
  alias Jalka2020.Accounts
  alias Jalka2020.Accounts.User

  def mount(_session, socket) do
    {:ok,
      assign(socket, %{
        changeset: Accounts.change_user(%User{})
      })}
  end

  def render(assigns), do: UserView.render("new.html", assigns)

  def handle_event("validate", %{"user" => params}, socket) do
    changeset =
      %User{}
      |> Accounts.change_user(params)
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"user" => user_params}, socket) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        {:stop,
          socket
          |> put_flash(:info, "User created successfully.")
          |> redirect(to: Routes.live_path(socket, UserLive.Show, user))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
