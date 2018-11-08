module MemoriesService
  module_function

  def new_memory
    informations = Ipstack::API.check
    current_weather = fetch_current_weather(informations["latitude"], informations["longitude"])
    
    memory = Memory.new
    memory.day = Date.today
    memory.city = informations["city"]
    memory.lat = informations["latitude"]
    memory.long = informations["longitude"]
    memory.temperature = current_weather["main"]["temp"]
    memory.weather = Weather.find_by(description: current_weather["weather"][0]["main"])

    return memory
  end

  def get_all(user)
    return Memory.all.where(user_id: user.id)
  end

  def get_by_id(user, params)
    return Memory.where(user_id: user.id).find(params[:id])
  end

  def create(user, params)
    memory = Memory.new(params)
    memory.user_id = user.id

    memory.save
  end

  def fetch_current_weather(lat, long)
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{long}&APPID=#{ENV['OPEN_WEATHER_ACCESS_KEY']}")
    puts response
    return response
  end
end