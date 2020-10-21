defmodule SoPostTask.Repo do
  use Ecto.Repo,
    otp_app: :soPostTask,
    adapter: Ecto.Adapters.Postgres
end
