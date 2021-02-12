class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def keyword
    return if request.get?

    if request.post?
      if !@user.tag_list.include? params[:q]
        @user.tag_list.add(params[:q])
        flash.now[:notice] = '키워드가 추가되었습니다.'
      else
        flash.now[:alert] = '이미 추가된 키워드 입니다.'
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
