class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.create!(item_params)

    redirect_to items_path
    # redirect_to list_path(item.list)
  end

  def destroy
    item = Items.find(params[:id])
    item.destroy

    redirect_to items_path
    # redirect_to list_path(item.list)
  end

  private

  def item_params
    params.require(:item).permit(:name, :due_at)
  end
end
