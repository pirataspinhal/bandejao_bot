defmodule USP.Restaurant.Periods do
  @derive [Poison.Encoder]
  defstruct [ :breakfast, :lunch, :dinner ]
end

defmodule USP.Restaurant.WorkingHours do
  @derive [Poison.Encoder]
  defstruct [
    sunday: %USP.Restaurant.Periods{},
    saturday: %USP.Restaurant.Periods{},
    weekdays: %USP.Restaurant.Periods{},
  ]
end

defmodule USP.Restaurant.Prices do
  @derive [Poison.Encoder]
  defstruct [
    employees: %USP.Restaurant.Periods{},
    special: %USP.Restaurant.Periods{},
    students: %USP.Restaurant.Periods{},
    visiting: %USP.Restaurant.Periods{}
  ]
end

defmodule USP.Restaurant.Cashiers do
  @derive [Poison.Encoder]
  defstruct [
    :address, :latitude, :longitude,
    :workinghours, prices: %USP.Restaurant.Prices{}
  ]
end

defmodule USP.Restaurant do
  @derive [Poison.Encoder]
  defstruct [
    :address, :alias, :hasCashier,
    :longitude, :latitude, :phones, :photourl,
    workinghours: %USP.Restaurant.WorkingHours{},
    cashiers: [%USP.Restaurant.Cashiers{}]
  ]
end

defmodule USP.Campus do
  @derive [Poison.Encoder]
  defstruct [:name, restaurants: [%USP.Restaurant{}]]
end
