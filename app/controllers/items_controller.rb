class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def create
    @item = Item.new(params.require(:item).permit(:title, :text))

    @item.save
    redirect_to @item
  end

  private
  def item_params
    params.require(:item).permit(:title, :text)
  end
end
