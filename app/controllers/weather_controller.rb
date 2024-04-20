require 'open-uri'
require 'json'

class WeatherController < ApplicationController
  def index
    if params[:city].present?
      api_key = '968279423fb9040c6179fd46638ac878' # Replace 'YOUR_API_KEY' with your actual API key
      city = params[:city]

      url = "http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}"
      response = URI.open(url).read
      data = JSON.parse(response)

      @weather = {
        temperature: kelvin_to_celsius(data['main']['temp']).round(2),
        description: data['weather'][0]['description'],
        city: data['name']
      }
    end
  end

  private
 
  def kelvin_to_celsius(kelvin)
    kelvin - 273.15
  end
end
