defmodule PhoenixDemo.Post do
  use PhoenixDemo.Web, :model

  schema "posts" do
    field :text, :string
    belongs_to :user, PhoenixDemo.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:text])
    |> validate_required([:text])
  end
end
