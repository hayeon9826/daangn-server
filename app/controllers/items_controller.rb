class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :destroy, :update]

  def index
  end

  def show
  end

  def create
    begin
      @item = Item.create(item_params)
      redirect_to item_path(@item), notice: "게시물을 업로드했습니다."
    rescue
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "게시물을 수정했습니다."
    else
      render 'edit', alert: "다시 시도해주세요"
    end
  end

  def new
  end

  def edit
  end

  def destroy
    begin
      @item.destroy
      redirect_to root_path, notice: "상품을 삭제했습니다."
    rescue
    end
  end

  private

  def set_item
    @item = Item.find_by(id: params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :price, :desc, :location, :price, :user_id, :image)
  end
end
