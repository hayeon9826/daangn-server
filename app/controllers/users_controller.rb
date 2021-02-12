class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def keyword
    # 키워드 페이지 접속
    return if request.get?
    # 키워드 생성
    if request.post?
      if !@user.tag_list.include? params[:q]
        @user.tag_list.add(params[:q])
        flash.now[:notice] = '키워드를 추가했습니다.'
      else
        flash.now[:alert] = '이미 추가된 키워드입니다.'
      end
    # 키워드 삭제
    elsif request.delete?
      @user.tag_list.remove(params[:q])
      flash.now[:notice] = '키워드를 삭제했습니다.'
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
