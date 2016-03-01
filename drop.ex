defmodule Drop do
  @moduledoc """
  Functions calculating velocities achieved by objects dropped in a vacuum.

  from *Introducing Elixir*, O'Reilly Media, Inc., 2014.
  Copyright 2014 by Simon St.Laurent and J. David Eisenberg.
  """
  # @vsn 0.1
  #
  # @doc """
  # Calculates the velocity of an object falling on Earth
  # as if it were in a vacuum (no air resistance).  The distance is
  # the height from which the object falls, specified in meters,
  # and the function returns a velocity in meters per second.
  # Optional second parameter to specify acceleration due to gravity
  # other than that on the surface of Earth.
  # """

  # @spec fall_velocity(number, number) :: number

  import :math, only: [sqrt: 1]

  def fall_velocity({planemo, distance}) when distance >= 0 do
    fall_velocity(planemo, distance)
  end

  defp fall_velocity(:earth, distance) do
    sqrt(2 * 9.8 * distance)
  end

  defp fall_velocity(:moon, distance) do
    sqrt(2 * 1.6 * distance)
  end

  defp fall_velocity(:mars, distance) do
    sqrt(2 * 3.71 * distance)
  end

end

defmodule Drop2 do

  def fall_velocity(_, distance) when distance >= 0 do
    :math.sqrt(2 * 9.8 * distance)
  end
end
