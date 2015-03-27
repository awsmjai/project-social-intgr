class HomeController < ApplicationController
  def index
  	@instagram = Instagram.user_recent_media("1792475136")

    client = Instagram.client(:access_token => session[:access_token])
    unless params[:q].blank?
      tags = client.tag_search(params[:q])
      @tag = client.tag_recent_media(tags[0].name)
      @count=  tags[0].media_count
    else
  	  @tag = client.tag_recent_media('persistent')
    end
  end
end
