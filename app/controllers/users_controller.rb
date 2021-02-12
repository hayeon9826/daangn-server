class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def keyword
    return if request.get?

    if request.post?
      if !@user.tag_list.include? params[:q]
        @user.tag_list.add(params[:q])
      end
    elsif request.delete?
      @user.tag_list.remove(params[:q])
    end

    @result = @user.save
  end

  def items
    @items = current_user.items
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

end
