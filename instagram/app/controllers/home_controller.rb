class HomeController < ApplicationController
  def index
  	 @instagram = Instagram.user_recent_media("1792475136")
  end
end
