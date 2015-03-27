class HomeController < ApplicationController
  def index
  	 @instagram = Instagram.user_recent_media("1792475136")

     client = Instagram.client(:access_token => session[:access_token])
     #html = "<h1>Search for tags, get tag info and get media by tag</h1>"
     
     tags = client.tag_search(params[:q])
     @tag = client.tag_recent_media(tags[0].name)
     @count=  tags[0].media_count
  end
end
