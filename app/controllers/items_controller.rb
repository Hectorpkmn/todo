class ItemsController < ApplicationController
  def index
    @items = Item.where(user_id: current_user.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params.merge(:user_id => current_user.id))

    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

def destroy
  @item = Item.find(params[:id])
  @item.destroy

  redirect_to items_path
end

  private
  def item_params
    params.require(:item).permit(:title, :text, :user_id)
  end
end
