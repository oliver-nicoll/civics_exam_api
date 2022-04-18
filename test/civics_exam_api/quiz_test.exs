defmodule CivicsExamApi.QuizTest do
  use CivicsExamApi.DataCase

  alias CivicsExamApi.Quiz

  describe "questions" do
    alias CivicsExamApi.Quiz.Question

    import CivicsExamApi.QuizFixtures

    @invalid_attrs %{answers: nil, correct_answer: nil, description: nil, questions: nil, score: nil, single_question: nil, title: nil, total_right: nil}

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert Quiz.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert Quiz.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      valid_attrs = %{answers: "some answers", correct_answer: "some correct_answer", description: "some description", questions: "some questions", score: 42, single_question: "some single_question", title: "some title", total_right: 42}

      assert {:ok, %Question{} = question} = Quiz.create_question(valid_attrs)
      assert question.answers == "some answers"
      assert question.correct_answer == "some correct_answer"
      assert question.description == "some description"
      assert question.questions == "some questions"
      assert question.score == 42
      assert question.single_question == "some single_question"
      assert question.title == "some title"
      assert question.total_right == 42
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Quiz.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      update_attrs = %{answers: "some updated answers", correct_answer: "some updated correct_answer", description: "some updated description", questions: "some updated questions", score: 43, single_question: "some updated single_question", title: "some updated title", total_right: 43}

      assert {:ok, %Question{} = question} = Quiz.update_question(question, update_attrs)
      assert question.answers == "some updated answers"
      assert question.correct_answer == "some updated correct_answer"
      assert question.description == "some updated description"
      assert question.questions == "some updated questions"
      assert question.score == 43
      assert question.single_question == "some updated single_question"
      assert question.title == "some updated title"
      assert question.total_right == 43
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = Quiz.update_question(question, @invalid_attrs)
      assert question == Quiz.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = Quiz.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Quiz.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = Quiz.change_question(question)
    end
  end
end
