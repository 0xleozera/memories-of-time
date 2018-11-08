module WeatherService
  module_function

  def list_weathers
    return Weather.all.pluck(:description, :id)
  end
end