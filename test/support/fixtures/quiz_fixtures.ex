defmodule CivicsExamApi.QuizFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CivicsExamApi.Quiz` context.
  """

  @doc """
  Generate a question.
  """
  def question_fixture(attrs \\ %{}) do
    {:ok, question} =
      attrs
      |> Enum.into(%{
        answers: "some answers",
        correct_answer: "some correct_answer",
        description: "some description",
        questions: "some questions",
        score: 42,
        single_question: "some single_question",
        title: "some title",
        total_right: 42
      })
      |> CivicsExamApi.Quiz.create_question()

    question
  end
end
