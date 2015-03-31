class HomeController < ApplicationController
  def index
  	@instagram = Instagram.user_recent_media("1792475136")

    client = Instagram.client(:access_token => session[:access_token])
    #@media=client.media_search("37.7808851","-122.3948632")
    unless params[:q].blank?
      tags = client.tag_search(params[:q])
      @tag = client.tag_recent_media(tags[0].name, options = {:count => 100})
      @count=  tags[0].media_count
    else
  	  @tag = client.tag_recent_media('persistent')
    end
     @location = Location.all
  end
end
