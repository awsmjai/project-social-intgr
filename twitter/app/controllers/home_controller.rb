class HomeController < ApplicationController
  def index
    get_client
    
  unless params[:address].blank?
    lat = Geocoder.search(params[:address]).first.coordinates.first
    lng = Geocoder.search(params[:address]).first.coordinates.last
   
	  unless params[:q].blank?
      @tweet = @client.search(params[:q], :result_type => "recent", :geocode => "#{lat},#{lng},100mi").take(10)
    else
  	  @tweet = @client.search("facebook", :result_type => "recent", :geocode => "#{lat},#{lng},10mi").take(5)
    end
  else
    @tweet = @client.search(params[:q], :result_type => "recent").take(10)
  end


  end

  def get_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "5rHv2ZmtpLT5ANcRwP6HnWFnI"
      config.consumer_secret     = "2HqQ1zcQDsCSauD5mKa8DDh6F8n6KXEH2vtw4m9MRBcs6QxBkB"
  	  config.access_token        = "2381587561-PAfyvBC02Ne8E6x4YFrla4LIQUOuOb7An1qzpLM"
  	  config.access_token_secret = "XrKEVZ6wZ9artQmn9GKYDiyZirB0yJf8GFJpqckzXdtCH"
	end
  end
end