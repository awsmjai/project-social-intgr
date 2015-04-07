class HomeController < ApplicationController
  def index
    get_client
    unless params[:address].blank?
      lat = Geocoder.search(params[:address]).first.coordinates.first
      lng = Geocoder.search(params[:address]).first.coordinates.last
   
      @tweet = @client.search(params[:q], :include_entities=>true, :result_type => "recent", :geocode => "#{lat},#{lng},10mi").take(20)
    else
      if params[:q].present?
        @tweet = @client.search(params[:q], :include_entities=>true, :result_type => "recent").take(20)
      else
        @tweet = @client.search("facebook", :include_entities=>true, :result_type => "recent").take(20)
      end
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