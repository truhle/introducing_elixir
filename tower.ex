defmodule Tower do
  defstruct location: "", height: 20, planemo: :earth, name: ""

  defimpl Valid, for: Tower do
    def valid?(t) do
      t.height >= 0 && t.planemo != nil
    end
  end

  defimpl Inspect, for: Tower do
    import Inspect.Algebra
    def inspect(item, _options) do
      meters = concat(to_string(item.height), "m:")
      msg = concat([meters, break, item.name, ",", break,
        item.location, ",", break, to_string(item.planemo)])
    end
  end
end
