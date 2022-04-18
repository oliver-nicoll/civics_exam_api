defmodule CivicsExamApiWeb.QuestionControllerTest do
  use CivicsExamApiWeb.ConnCase

  import CivicsExamApi.QuizFixtures

  alias CivicsExamApi.Quiz.Question

  @create_attrs %{
    answers: "some answers",
    correct_answer: "some correct_answer",
    description: "some description",
    questions: "some questions",
    score: 42,
    single_question: "some single_question",
    title: "some title",
    total_right: 42
  }
  @update_attrs %{
    answers: "some updated answers",
    correct_answer: "some updated correct_answer",
    description: "some updated description",
    questions: "some updated questions",
    score: 43,
    single_question: "some updated single_question",
    title: "some updated title",
    total_right: 43
  }
  @invalid_attrs %{answers: nil, correct_answer: nil, description: nil, questions: nil, score: nil, single_question: nil, title: nil, total_right: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all questions", %{conn: conn} do
      conn = get(conn, Routes.question_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create question" do
    test "renders question when data is valid", %{conn: conn} do
      conn = post(conn, Routes.question_path(conn, :create), question: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.question_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "answers" => "some answers",
               "correct_answer" => "some correct_answer",
               "description" => "some description",
               "questions" => "some questions",
               "score" => 42,
               "single_question" => "some single_question",
               "title" => "some title",
               "total_right" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.question_path(conn, :create), question: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update question" do
    setup [:create_question]

    test "renders question when data is valid", %{conn: conn, question: %Question{id: id} = question} do
      conn = put(conn, Routes.question_path(conn, :update, question), question: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.question_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "answers" => "some updated answers",
               "correct_answer" => "some updated correct_answer",
               "description" => "some updated description",
               "questions" => "some updated questions",
               "score" => 43,
               "single_question" => "some updated single_question",
               "title" => "some updated title",
               "total_right" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, question: question} do
      conn = put(conn, Routes.question_path(conn, :update, question), question: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete question" do
    setup [:create_question]

    test "deletes chosen question", %{conn: conn, question: question} do
      conn = delete(conn, Routes.question_path(conn, :delete, question))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.question_path(conn, :show, question))
      end
    end
  end

  defp create_question(_) do
    question = question_fixture()
    %{question: question}
  end
end
