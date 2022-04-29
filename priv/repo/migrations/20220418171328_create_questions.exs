defmodule CivicsExamApi.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :title, :string
      add :description, :text
      add :questions, :lists
      add :single_question, :string
      add :answers, :string
      add :correct_answer, :string
      add :total_right, :integer
      add :score, :integer

      timestamps()
    end
  end
end
