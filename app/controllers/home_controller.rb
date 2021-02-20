class HomeController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc)
    if current_user
      @notifications = current_user.notifications.order(created_at: :desc)
    else
      @notifications = nil
    end
  end


end
