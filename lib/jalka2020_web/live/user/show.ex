defmodule Jalka2020Web.UserLive.Show do
  use Phoenix.LiveView
  use Phoenix.HTML

  alias Jalka2020Web.UserView
  alias Jalka2020.Accounts
  alias Phoenix.LiveView.Socket

  def render(assigns), do: UserView.render("show.html", assigns)

  def mount(%{path_params: %{"id" => id}}, socket) do
    {:ok, fetch(assign(socket, id: id))}
  end

  defp fetch(%Socket{assigns: %{id: id}} = socket) do
    assign(socket, user: Accounts.get_user!(id))
  end
end
