require 'open_weather'

class Weather

  DEF_UNITS = 'metric'
  API_KEY = Rails.application.secrets.weather_api_key
  CITY_ID = "3239318"

  def initialize(result)
    @result = result
  end

  def self.today
    options = { units: DEF_UNITS, APPID: API_KEY }
    result = OpenWeather::Current.city_id(CITY_ID, options)
    new(result)
  end

  # Not working. Due to free API limitations?
  def self.daily(count)
    options = { cnt: count, units: DEF_UNITS, APPID: API_KEY }
    OpenWeather::ForecastDaily.city_id(CITY_ID, options)
  end

  def temperature
    @result.dig("main", "temp")
  end

  def condition
    @result.dig("weather", 0, "description")
  end

  def icon
    url = "http://openweathermap.org/img/w/"
    icon_name = @result.dig("weather", 0, "icon")
    unless icon_name.nil?
      url << icon_name
      url << ".png"
    end
    return url
  end
end

# {"coord"=>{"lon"=>14.51, "lat"=>46.06}, "weather"=>[{"id"=>804, "main"=>"Clouds", "description"=>"overcast clouds", "icon"=>"04d"}],
# "base"=>"stations", "main"=>{"temp"=>8, "pressure"=>1021, "humidity"=>93, "temp_min"=>8, "temp_max"=>8}, "visibility"=>10000,
# "wind"=>{"speed"=>1, "deg"=>240}, "clouds"=>{"all"=>90}, "dt"=>1510230600, "sys"=>{"type"=>1, "id"=>5882, "message"=>0.0045,
# "country"=>"SI", "sunrise"=>1510206888, "sunset"=>1510241775}, "id"=>3239318, "name"=>"Mestna Občina Ljubljana", "cod"=>200} 