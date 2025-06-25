class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :introduction, :image, :category_id, :condition_id, :fee_id, :prefecture_id,
                                 :delivery_time_id, :price).merge(user_id: current_user.id)
  end
end
