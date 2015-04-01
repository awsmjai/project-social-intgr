class HomeController < ApplicationController
  def index
  	@instagram = Instagram.user_recent_media("1792475136")

    client = Instagram.client(:access_token => session[:access_token])
    @media=client.media_search("28.6139","77.2090")
    unless params[:q].blank?
      tags = client.tag_search(params[:q])
      @tag1 = client.tag_recent_media(tags[0].name, count: 100)
      @max_tag_id1 = @tag1.pagination.next_max_tag_id
      @tag2 = client.tag_recent_media(tags[0].name,count: 100, max_id: @max_tag_id1) unless @max_tag_id1.nil?
      @max_tag_id2 = @tag2.pagination.next_max_tag_id
      @tag3 = client.tag_recent_media(tags[0].name,count: 100, max_id: @max_tag_id2) unless @max_tag_id2.nil?
      @max_tag_id3 = @tag3.pagination.next_max_tag_id
      @tag4 = client.tag_recent_media(tags[0].name,count: 100, max_id: @max_tag_id3) unless @max_tag_id3.nil?
      @max_tag_id4 = @tag4.pagination.next_max_tag_id
  
      @count=  tags[0].media_count
    else
  	  @tag1 = client.tag_recent_media('worldcup2015')
      @tag2 = client.tag_recent_media('teamindia')
      @tag3 = client.tag_recent_media('nzvsaus')
      @tag4 = client.tag_recent_media('indiavsaus')
    end
     @location = Location.all
  end
end
