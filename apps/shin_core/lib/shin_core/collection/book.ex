defmodule ShinCore.Collection.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :href, :string
    field :name, :string

    timestamps()
  end

  @default_fields [
    :id,
    :inserted_at,
    :updated_at
  ]

  @required_fields []

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, __MODULE__.__schema__(:fields) -- @default_fields)
    |> validate_required(@required_fields)
  end
end
