class HomeController < ApplicationController
  def index

    if !browser.device.mobile? and !browser.device.tablet? and params[:web].blank?
      redirect_to "/web"
    end
    @items = Item.all.order(created_at: :desc)
    if current_user
      @notifications = current_user.notifications.order(created_at: :desc)
    else
      @notifications = nil
    end
  end

  def web
    if browser.device.mobile? or browser.device.tablet?
      redirect_to "/"
    end
  end

end
