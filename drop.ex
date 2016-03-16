defmodule Drop do
  require Planemo
  require Functionmaker

  Functionmaker.create_functions([{:mercury, 3.7}, {:venus, 8.9}, {:earth, 9.8}, {:moon, 1.6}, {:mars, 3.7}, {:jupiter, 23.1}, {:saturn, 9.0}, {:uranus, 8.7}, {:neptune, 11.0}, {:pluto, 0.6}])
  
  def drop do
    setup
    handle_drops
  end

  import :math, only: [sqrt: 1]

  def handle_drops do
    receive do
      {from, planemo, distance} ->
        send(from, {planemo, distance, fall_velocity(planemo, distance)})
      handle_drops()
    end
  end

  def fall_velocity({planemo, distance}) when distance >= 0 do
    fall_velocity(planemo, distance)
  end

  def fall_velocity(planemo, distance) when distance >= 0 do
    # p = hd(:ets.lookup(:planemos, planemo))
    # sqrt(2 * Planemo.planemo(p, :gravity) * distance)
    {:atomic, [p | _]} = :mnesia.transaction(fn() ->
      :mnesia.read(PlanemoTable, planemo) end)
    sqrt(2 * Planemo.planemo(p, :gravity) * distance)
  end

  def setup do
    :mnesia.create_schema([node()])
    :mnesia.start
    :mnesia.create_table(PlanemoTable, [{:attributes, [:name, :gravity, :diameter, :distance_from_sun]},
    {:record_name, :planemo}])

    f = fn ->
      :mnesia.write(PlanemoTable, Planemo.planemo(name: :mercury, gravity: 3.7,
        diameter: 4878, distance_from_sun: 57.9), :write)
      :mnesia.write(PlanemoTable, Planemo.planemo(name: :venus, gravity: 8.9,
        diameter: 12104, distance_from_sun: 108.2), :write)
      :mnesia.write(PlanemoTable, Planemo.planemo(name: :earth, gravity: 9.8,
        diameter: 12756, distance_from_sun: 149.6), :write)
      :mnesia.write(PlanemoTable, Planemo.planemo(name: :mars, gravity: 3.7,
        diameter: 6787, distance_from_sun: 227.9), :write)
      :mnesia.write(PlanemoTable, Planemo.planemo(name: :moon, gravity: 1.6,
        diameter: 3475, distance_from_sun: 149.6), :write)
      :mnesia.write(PlanemoTable, Planemo.planemo(name: :ceres, gravity: 0.27,
        diameter: 950, distance_from_sun: 778.3), :write)
      :mnesia.write(PlanemoTable, Planemo.planemo(name: :jupiter, gravity: 23.1,
        diameter: 142796, distance_from_sun: 227.9), :write)
      :mnesia.write(PlanemoTable, Planemo.planemo(name: :saturn, gravity: 9.0,
        diameter: 120660, distance_from_sun: 1427.0), :write)
      :mnesia.write(PlanemoTable, Planemo.planemo(name: :uranus, gravity: 8.7,
        diameter: 51118, distance_from_sun: 2871.0), :write)
      :mnesia.write(PlanemoTable, Planemo.planemo(name: :neptune, gravity: 11.0,
        diameter: 30200, distance_from_sun: 4497.1), :write)
      :mnesia.write(PlanemoTable, Planemo.planemo(name: :pluto, gravity: 0.6,
        diameter: 2300, distance_from_sun: 5913.0), :write)
      :mnesia.write(PlanemoTable, Planemo.planemo(name: :haumea, gravity: 0.44,
        diameter: 1150, distance_from_sun: 6484.0), :write)
      :mnesia.write(PlanemoTable, Planemo.planemo(name: :makemake, gravity: 0.5,
        diameter: 1500, distance_from_sun: 6850.0), :write)
      :mnesia.write(PlanemoTable, Planemo.planemo(name: :eris, gravity: 0.8,
        diameter: 2400, distance_from_sun: 10210.0), :write)
      end

      :mnesia.transaction(f)
  end

  # def setup do
  #   :ets.new(:planemos, [:named_table,
  #     {:keypos, Planemo.planemo(:name) + 1}])
  #   info = [
  #     {:mercury, 3.7, 4878, 57.9},
  #     {:venus, 8.9, 12104, 108.2},
  #     {:earth, 9.8, 12756, 149.6},
  #     {:moon, 1.6, 3475, 149.6},
  #     {:mars, 3.7, 6787, 227.9},
  #     {:ceres, 0.27, 950, 413.7},
  #     {:jupiter, 23.1, 142796, 778.3},
  #     {:saturn, 9.0, 120660, 1427.0},
  #     {:uranus, 8.7, 51118, 2871.0},
  #     {:neptune, 11.0, 30200, 4497.1},
  #     {:pluto, 0.6, 2300, 5913.0},
  #     {:haumea, 0.44, 1150, 6484.0},
  #     {:makemake, 0.5, 1500, 6850.0},
  #     {:eris, 0.8, 2400, 10210.0}
  #   ]
  #   insert_into_table(info)
  # end
  #
  # def insert_into_table([]) do
  #   :undefined
  # end
  #
  # def insert_into_table([{name, gravity, diameter, distance} | tail]) do
  #   :ets.insert(:planemos, Planemo.planemo(name: name, gravity: gravity, diameter: diameter, distance_from_sun: distance))
  #   insert_into_table(tail)
  # end



end
