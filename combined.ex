#convenience functions!
defmodule Combined do
  import Convert

  def height_to_mph(body \\ :earth, meters) do #takes meters, returns mph
    Drop.fall_velocity(body, meters) |> mps_to_mph
  end
end
