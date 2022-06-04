class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=88901&distance=0&API_KEY=61342EE3-66D1-417E-AAD6-5F47461D6053'
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

    if @final_output == "Error"
        @api_color = "silver"
    elsif @final_output <= 50
        @api_color = "green"
        @api_description = "Current Air Quality (0-50) Good"
    elsif @final_output >= 51 && @final_output <= 100
        @api_color = "yellow"
        @api_description = "Current Air Quality (51-100) Moderate"
    elsif @final_output >= 101 && @final_output <= 150
        @api_color = "orange"
        @api_description = "Current Air Quality (101-150) Unhealthy for Sensitive Groups"
    elsif @final_output >= 151 && @final_output <= 200
        @api_color = "red"
        @api_description = "Current Air Quality (151-200) Unhealthy"
    elsif @final_output >= 201 && @final_output <= 300
        @api_color = "purple"
        @api_description = "Current Air Quality (201-300) Very Unhealthy"
    elsif @final_output >= 301 && @final_output <= 500
        @api_color = "maroon"
        @api_description = "Current Air Quality (301-500) Hazardous"
    end
  end

    def zipcode
      @zip_query = params[:zipcode]
      if params[:zipcode] == ""
        @zip_query = "...Hey you forgot to enter the "
      elsif params[:zipcode]
      

    require 'net/http'
    require 'json'
    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=' + @zip_query.to_s + '&distance=0&API_KEY=61342EE3-66D1-417E-AAD6-5F47461D6053'
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

    if @final_output == "Error"
        @api_color = "silver"
    elsif @final_output <= 50
        @api_color = "green"
        @api_description = "Current Air Quality (0-50) Good"
    elsif @final_output >= 51 && @final_output <= 100
        @api_color = "yellow"
        @api_description = "Current Air Quality (51-100) Moderate"
    elsif @final_output >= 101 && @final_output <= 150
        @api_color = "orange"
        @api_description = "Current Air Quality (101-150) Unhealthy for Sensitive Groups"
    elsif @final_output >= 151 && @final_output <= 200
        @api_color = "red"
        @api_description = "Current Air Quality (151-200) Unhealthy"
    elsif @final_output >= 201 && @final_output <= 300
        @api_color = "purple"
        @api_description = "Current Air Quality (201-300) Very Unhealthy"
    elsif @final_output >= 301 && @final_output <= 500
        @api_color = "maroon"
        @api_description = "Current Air Quality (301-500) Hazardous"
    end
  end
end
end

