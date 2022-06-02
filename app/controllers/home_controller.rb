class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=07302&distance=0&API_KEY=61342EE3-66D1-417E-AAD6-5F47461D6053'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    if @output.empty?
        @final_output = "Error"
    elsif !@output 
        @final_output = "Error"
    else
        @final_output = @output[0]['AQI']
    
    end
  end
end
