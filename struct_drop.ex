defmodule StructDrop do
  # def fall_velocity(%Tower{planemo: planemo, height: distance}) do
  #   Drop.fall_velocity(planemo, distance)
  # end

  # def fall_velocity(t) do
  #   Drop.fall_velocity(t.planemo, t.height)
  # end

  def fall_velocity(t = %Tower{planemo: planemo, height: distance}) do
    IO.puts("From #{t.name}'s elevation of #{distance} meters on #{planemo},")
    IO.puts("the object will reach #{Drop.fall_velocity(planemo, distance)} m/s")
    IO.puts("before crashing in #{t.location}")
  end
end
