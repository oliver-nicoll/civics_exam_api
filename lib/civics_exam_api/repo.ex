defmodule CivicsExamApi.Repo do
  use Ecto.Repo,
    otp_app: :civics_exam_api,
    adapter: Ecto.Adapters.Postgres
end
