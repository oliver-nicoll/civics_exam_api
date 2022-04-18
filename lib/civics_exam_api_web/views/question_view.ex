defmodule CivicsExamApiWeb.QuestionView do
  use CivicsExamApiWeb, :view
  alias CivicsExamApiWeb.QuestionView

  def render("index.json", %{questions: questions}) do
    %{data: render_many(questions, QuestionView, "question.json")}
  end

  def render("show.json", %{question: question}) do
    %{data: render_one(question, QuestionView, "question.json")}
  end

  def render("question.json", %{question: question}) do
    %{
      id: question.id,
      title: question.title,
      description: question.description,
      questions: question.questions,
      single_question: question.single_question,
      answers: question.answers,
      correct_answer: question.correct_answer,
      total_right: question.total_right,
      score: question.score
    }
  end
end
