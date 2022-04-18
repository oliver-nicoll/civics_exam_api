defmodule CivicsExamApi.Quiz.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :answers, :string
    field :correct_answer, :string
    field :description, :string
    field :questions, :string
    field :score, :integer
    field :single_question, :string
    field :title, :string
    field :total_right, :integer

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:title, :description, :questions, :single_question, :answers, :correct_answer, :total_right, :score])
    |> validate_required([:title, :description, :questions, :single_question, :answers, :correct_answer, :total_right, :score])
  end
end
